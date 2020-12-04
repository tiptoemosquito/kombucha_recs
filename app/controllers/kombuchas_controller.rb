class KombuchasController < ApplicationController
    before_action :set_kombucha, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        if params[:flavor_id]
            @kombuchas = Flavor.find(params[:flavor_id]).kombuchas
        else
            @kombuchas = current_user.kombuchas
        end
    end

    def show
    end

    def new
        if params[:flavor_id]
            @flavor = current_user.flavors.find_by(id: params[:kombucha_id])
            @kombucha = current_user.kombuchas.build(flavor_id: params[:flavor_id])
        else
            @kombucha = current_user.kombuchas.build
        end
    end

    def create 
        @kombucha = current_user.kombuchas.build(kombucha_params)
        if @kombucha.save
            redirect_to @kombucha, notice: 'Success, Kombucha added!'
        else 
            render :new
        end
    end

    def edit
    end
    
    def update
        if @kombucha.update(kombucha_params)
            redirect_to @kombucha, notice: 'Updated!'
        else
            render :edit
        end
    end

    def destroy
        @kombucha.destroy
        redirect_to kombuchas_path, notice: 'Kombucha deleted!'
    end

    def alcohol
        @kombuchas = current_user.kombuchas.alcohol
    end

    private


    def set_kombucha
        @kombucha = current_user.kombuchas.find_by(id: params[:id])
        if !@kombucha
            redirect_to kombuchas_path, notice: "Access Denied!"
        end
    end
    #strong params
    def kombucha_params
        params.require(:kombucha).permit(:brand, :ounces, :alcohol, :user_id, :flavor_id, flavor_attributes: [:name])
    end

end
