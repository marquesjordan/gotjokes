class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            Profile.create(:user_id => @user.id, :name => @user.username)
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end


