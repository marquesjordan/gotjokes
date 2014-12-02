class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
          # if @user.save
          #   Profile.create(:user_id => @user.id)

        if @user.save
            Profile.create(:user_id => @user.id, :name => @user.username)

            session[:user_id] = @user.id
            format.html { redirect_to jokes_path, notice: 'User was successfully created.' }
            format.json { render action: 'show', status: :created, location: @user }
          else
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
    end
  end


    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end


end

def create
        @user = User.new(user_params)
        if @user.save
            Profile.create(:user_id => @user.id)
            session[:user_id] = @user.id
            redirect_to users_path
        else
            redirect_to new_user_path, notice: @user.errors
        end
    end

