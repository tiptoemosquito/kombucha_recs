class SessionsController < ApplicationController

    def new 
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user), notice: "Welcome!"
        else 
            redirect_to new_user_session_path
        end
    end

    def destroy 
        session[:user_id] = nil
        redirect_to root_url    
    end

end
