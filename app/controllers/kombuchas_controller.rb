class KombuchasController < ApplicationController
    
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
        @kombucha = current_user.kombuchas.build(kombucha_params)
        if @kombucha.save
            redirect_to @kombucha, notice: 'Success! You have added a new kombucha to your list.'
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

    def low_calorie
        @kombuchas = current_user.kombuchas.calories
    end

    private

    #strong params
    def kombucha_params
    end

end
