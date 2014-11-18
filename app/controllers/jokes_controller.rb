class JokesController < ApplicationController
  def index
  	@jokes = Joke.all
  end

  def new
  	@joke = Joke.new
  end

  def create
  	@joke = joke.new(joke_params)
  	if @joke.save
  		redirect_to jokes_path
  	else
  		render 'new'
  	end

  end

  def edit
  end

  private

  	def joke_params
  		params.require(:views, :totalviews)
  	end
end
