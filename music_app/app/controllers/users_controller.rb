class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(current_user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show 
        @user = current_user
        render :show
    end

    def destroy
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end 


end
