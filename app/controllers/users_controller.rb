class UsersController < ApplicationController

    def show
        # byebug
        @user = User.find_by(:id => (params[:id]))
    end

    def new
        @user = User.new
    end

   
    def create
        # raise.params

        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash[:error] = user.errors.full_messages.join(', ')
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :admin, :password)
    end
end
