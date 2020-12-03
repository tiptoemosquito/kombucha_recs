class FlavorsController < ApplicationController
    before_action :authenticate_user!

    def index
        @flavors = current_user.flavors
    end

    def new
        @flavor = Flavor.new
    end

    def create
        @flavor = current_user.flavors.build(flavor_params)
        if @flavor.save
            redirect_to flavor_path(@flavor)
        else
            redirect_to new_flavor_path
        end
    end

    def show
        @flavor = current_user.flavors.find_by(id: params[:id])
        if @flavor
            @kombuchas = current_user.kombuchas.where(flavor_id: params[:flavor_id])
            render :show
        end
    end

    def edit
        @flavor = Flavor.find_by(id: params[:id])
    end

    # def update
    #      @flavor = current_user.kombuchas.find_by(params[:id])
    #      @flavor.update!(flavor_params)
    #      redirect_to 
    # end

    private

    #strong params
    def flavor_params
        params.require(:flavor).permit(:name, :user_id, :kombucha_id)
    end
end
