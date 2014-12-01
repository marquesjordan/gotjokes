class JokesController < ApplicationController
  def index
  	@jokes = Joke.all
  end

  def new
  	@joke = Joke.new
  end

  def create
    @user = current_user
    
  	@joke = Joke.new(joke_params)
    @joke.user_id = @user.id
  	if @joke.save
  		redirect_to jokes_path
  	else
  		render 'new'
  	end
  end

  def show
    @joke = Joke.find(params[:id])
    @joke.views += 1
    @joke.save
    @trendingjokes = Joke.all
    @joke.user_comments.build

    u = User.where(id: @joke.user_id).first
    @username = u.username

    v = Vote.where(joke_id: @joke.id).length
    if v == 0
      Vote.create(user_id: @joke.user_id, vote: 1, joke_id: @joke.id )
    end
    @voted = Vote.where(user_id: current_user.id).last
    

    @usercomment = UserComment.new
    @jokecomments = UserComment.where(joke_id: @joke.id)

    @votes = Vote.where(joke_id: @joke.id)
    @likes = Vote.where(joke_id: @joke.id).where(vote: 1)
    @dislikes = Vote.where(joke_id: @joke.id).where(vote: -1)

  end

  def update
    @joke = Joke.find(params[:id])
    raise params.inspect
    if @joke.update_attributes(params.require(:joke).permit(joke_params))
      redirect_to joke_path
    else
      render 'show'
    end
  end

  def destroy
    @joke = Joke.find(params[:id])
    @joke.destroy
    redirect_to jokes_path
  end

  # only used to setup the api
  def jokeofday
    render json: Joke.first, status: 200
  end

  #======== SQL SEARCH START ===================================================================
  def search
    # SET JOKEWHERE VARIABLES TO PARAMETER VALUES
    # IF PARAMETER IS NIL SET IT TO EMPTY STRING
    if params[:jokeFilter] == nil
      jokeWhere = ''
    else
      jokeWhere = params[:jokeFilter]
    end 

    # CREATE A LABEL FOR THE FORM SHOWING THE USER WHAT IS BEING SHOWN
    if jokeWhere == ''
      @filterLabel = 'Showing all jokes'
    else
      @filterLabel = 'Results filtered by jokes who\'s '
      if jokeWhere != ''
        @filterLabel = @filterLabel + 'description matches: '+ '"' + jokeWhere + '" '
      end
    end

    # SET DEFAULT WHERE CLAUSE FILTERS IF THERE ARE NONE
    if jokeWhere === ''
      jokeWhere = '%%'
    end 

    # EXECUTE THE QUERY USING SQL
    @jokeData = Joke.find_by_sql([ 
      'SELECT id, views, totalvotes, video_file_name, video_content_type, video_file_size, video_updated_at, category_id, user_id, youtube, description ' +  
      'FROM jokes ' +
      'WHERE UPPER(description) LIKE UPPER(?) ' +
      'ORDER BY description ', "%#{jokeWhere}%"])
  end 
  #======== SQL SEARCH END ===================================================================

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  	def joke_params
      params.require(:joke).permit(:views, :totalvotes, :video, :youtube, :description, :user_id, :user_comments => [:description])
  	end
end
