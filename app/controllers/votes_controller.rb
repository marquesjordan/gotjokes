class VotesController < ApplicationController
  
  def index
    @votes = Vote.all
  end

  def show
    # @vote = Vote.find(params[:id])
    # # @pastries = @bean.pastries ;
  end

  def new
    @vote = Vote.new
    # raise params.inspect
    @uservote = params[:vote]
    @user_id = params[:user_id]
    @joke_id = params[:joke_id]
    Vote.create(vote: @uservote, user_id: @user_id, joke_id: @joke_id)
    redirect_to joke_path(@joke_id)
  end

  def create 
    # @vote = Vote.new(vote_params)
    # @user = current_user
    # @vote.user_id = @user.id
    if @vote.save
      redirect_to joke_path(@joke_id)
    else
      render 'new'
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:vote, :user_id, :joke_id)
  end

end
