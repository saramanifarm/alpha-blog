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

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_parms)
            flash[:notice] = "Your account details was updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 4)
    end

    private
    def user_parms
        params.require(:user).permit(:username, :email, :password)
    end
end