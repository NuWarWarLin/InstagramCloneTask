class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to posts_path
            flash[:alert] = "You are already Logged In!"
          end
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Congratulations! Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "There is somethin wrong with you own email or password!"
            render 'new'
       end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out successfully!"
        redirect_to root_path
    end
    
end
