class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # raise.params
        @user = User.new(user_params)
        # byebug
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path(@user)
        else
            flash[:error] = @user.errors.full_messages.join(', ')
            render :new
        end
    end

    def show
        # byebug
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :admin, :password)
    end
end
