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

  private

  	def joke_params
      params.require(:joke).permit(:views, :totalvotes, :video, :youtube, :description, :user_id, :user_comments => [:description])
  	end
end
