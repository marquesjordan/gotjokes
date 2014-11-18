class UserCommentsController < ApplicationController
  def index
  end

  def show
    @user_comment = user_comment.find(params[:id])
    # @pastries = @user_comment.pastries ;
  end

  def new
    @user_comment = user_comment.new
  end

  def create 
    @user_comment = user_comment.new(user_comment_params)
    if @user_comment.save
      redirect_to user_comments_path
    else
      render 'new'
    end
  end

  def edit
    @user_comment = user_comment.find(params[:id])
    # 1.times { @user_comment.pastries.build }
  end

  def update
    @user_comment = user_comment.find(params[:id])
    if @user_comment.update_attributes(user_comment_params)
      redirect_to user_comments_path
    else
      render 'edit'
    end
  end

  def destroy
    @user_comment = user_comment.find(params[:id])
    @user_comment.destroy
    redirect_to user_comments_path
  end

  private
  def user_comment_params
    params.require(:user_comment).permit(
      )
  end

end
