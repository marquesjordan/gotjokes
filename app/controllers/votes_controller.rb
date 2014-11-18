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
  end

  def create 
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to votes_path
    else
      render 'new'
    end
  end

  private
  def vote_params
    params.require(:vote).permit(
      :vote)
  end

end
