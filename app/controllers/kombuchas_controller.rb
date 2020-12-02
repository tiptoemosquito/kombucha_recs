class KombuchasController < ApplicationController
    before_action :kombucha_value, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @kombuchas = current_user.kombuchas
    end

    def show
    end

    def new
        @kombucha = Kombucha.new(user_id: params[:user_id])
    end

    def edit
    end

    def create 
        @kombucha = current_user.kombuchas.new(kombucha_params)
        if @kombucha.save
            redirect_to @kombucha, notice: 'Success! New Kombucha added.'
        else 
            render :new
        end
    end

    def update
        if @kombucha.update(kombucha_params)
            redirect_to @kombucha, notice: 'Your kombucha list has been updated.'
        else
            render :edit
        end
    end

    def destroy
        @kombucha.destroy
        redirect_to kombuchas_path, notice: 'Kombucha has been deleted from your list.'
    end

    def alcohol
        @kombuchas = current_user.kombuchas.alcohol
    end

    private

    def kombucha_value
        @kombucha = Kombucha.find_by(params[:id])
    end
    #strong params
    def kombucha_params
        params.require(:kombucha).permit(:brand, :alcohol, :ounces, :user_id, :flavor_id, flavor_attributes: [:name])
    end

end
