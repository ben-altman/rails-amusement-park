class RidesController < ApplicationController
    before_action :require_logged_in

    def new
    end

    def create
        @ride = Ride.create(attraction_id: params[:attraction_id], user_id:current_user.id)
        @user = @ride.user
        @notice = @ride.take_ride
        flash[:notice] = @notice
        # byebug
        redirect_to @user#, notice: "#{@notice}"
    end

    private

    # def ride_params
    #     params.require(:ride).permit(:attraction_id)
    # end
end