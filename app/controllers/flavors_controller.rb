class FlavorsController < ApplicationController

    def index
        @flavors = Flavor.all
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
    end

    def edit
        @flavor = Flavor.find_by(id: params[:id])
    end

    def update
    end

    private

    #strong params
    def flavor_params
        params.permit(:name, :ingredients, :alcohiolic, :user_id, :kombucha_id)
    end
end
