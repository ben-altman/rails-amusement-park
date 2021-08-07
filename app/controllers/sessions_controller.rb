class SessionsController < ApplicationController

    def new
    end

    def create
        # raise.params
        # byebug
        user = User.find_by(name: params[:user][:name])
        if user.try(:authenticate, params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = 'Incorrect username or password'
            redirect_to '/signin'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end