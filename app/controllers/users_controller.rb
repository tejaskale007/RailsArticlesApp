class UsersController < ApplicationController
    def new
       @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Blog, Sign Up successfull for #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit 
        @user = User.find(params[:id])
        if @user

        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "your account was updated"
            redirect_to articles_path
        else
            return 'edit'
        end
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end
    
    private 
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end