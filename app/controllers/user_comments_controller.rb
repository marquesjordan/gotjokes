class UserCommentsController < ApplicationController
  def index
    @user_comments = UserComment.all
  end

  def show
    @user_comment = UserComment.find(params[:id])
    # @pastries = @user_comment.pastries ;
  end

  def new
    @user_comment = UserComment.new
    # comment = params[:comment]
    # @id_joke = params[:j_id]
    # raise params.inspect
    # UserComment.create(description: comment, joke_id: @id_joke)
  end

  def create 
    @user = current_user
    joke = Joke.find(params[:joke_id])
    comment = UserComment.new(:description => params[:description])
    comment.user_id = @user.id
    joke.user_comments << comment
    # raise params.inspect
    if joke.save
      redirect_to joke_path(params[:joke_id])
    else
      render 'new'
    end
  end

  def edit
    @user_comment = UserComment.find(params[:id])
  end

  def update
    @user_comment = UserComment.find(params[:id])
    if @user_comment.update_attributes(user_comment_params)
      redirect_to user_comments_path
    else
      render 'edit'
    end
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    redirect_to user_comments_path
  end

  private
  def user_comment_params
    params.require(:user_comment).permit(:description, :user_id)
  end

end
