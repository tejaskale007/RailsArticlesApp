class UsersController < ApplicationController
    before_action :set_user , only: [:show, :edit , :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update , :destroy]
    
    def new
       @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Blog, Sign Up successfull for #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit 
        if @user
            
        end
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "your account was updated"
            redirect_to user_path
        else
            return 'edit'
        end
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def destroy
        flash[:notice] = "User deleted: " + @user.username
        if @user.destroy
            session[:user_id] = nil
            redirect_to root_path
        end
        
    end
    
    private 
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    
    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        byebug
        if current_user != @user
          flash[:alert] = "You can only edit your own account"
          redirect_to @user
        end
    end
end