class AttractionsController < ApplicationController
    before_action :require_logged_in

    def index
        @attractions = Attraction.all
    end
    
    def show
        @attraction = Attraction.find_by(:id => params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        if attraction.valid?
            redirect_to attraction_path(attraction.id)
        else
            flash[:error] = attraction.errors.full_messages.join(', ')
            render :new
        end
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])

        @attraction.update(attraction_params)

        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
