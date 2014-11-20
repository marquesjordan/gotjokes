class JokesController < ApplicationController
  def index
  	@jokes = Joke.all
  end

  def new
  	@joke = Joke.new

  end

  def create
  	@joke = Joke.new(joke_params)
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
    # @user_comment = UserComment.new
    @jokecomments = UserComment.where(joke_id: @joke.id)
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
      params.require(:joke).permit(:views, :totalvotes, :video, :user_comments => [:description])
  	end
end
