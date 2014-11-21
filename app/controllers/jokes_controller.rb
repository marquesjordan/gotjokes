class JokesController < ApplicationController
	skip_before_filter :authorize

  
    def index
      @jokes = Joke.all
    end

    def show
      @joke = Joke.find(params[:id])
    end

    def new
      @joke = Joke.new
    end

    def create
      @joke = Joke.new(params.require(:joke).permit(:name))
      if @joke.save
        redirect_to jokes_path
      else 
        render "new"
      end
    end

    def edit
      @joke = Joke.find(params[:id])
    end

    def update
      @joke = Joke.find(params[:id])
      if @joke.update_attributes(params.require(:joke).permit(:name))
        redirect_to joke_path
      else
        render "edit"
      end
    end

    def destroy
      @joke = Joke.find(params[:id])
      @joke.destroy
      redirect_to jokes_path
    end

    private

    def jokes_params
      params.require(:joke).permit(:name, :category_ids: [])
    end

    def find_joke
      @joke = Joke.find(params[:id])
    end
end