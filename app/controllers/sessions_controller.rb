class SessionsController < ApplicationController
    def new
        puts "here"
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            flash[:notice] = "Logged in successfully"   
            redirect_to user
        else
            flash[:alert] = "Invalid email/password combination"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end