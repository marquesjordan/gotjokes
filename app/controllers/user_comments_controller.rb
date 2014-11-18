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
  end

  def create 
    @user_comment = UserComment.new(user_comment_params)
    if @user_comment.save
      redirect_to user_comments_path
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
    params.require(:user_comment).permit(
      )
  end

end
