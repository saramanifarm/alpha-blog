class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_parms)
        if @user.save
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, You have successfully signup....."
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def user_parms
        params.require(:user).permit(:username, :email, :password)
    end
end