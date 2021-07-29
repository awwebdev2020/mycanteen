class User::ItemsController < ApplicationController
    def index
      @meals = policy_scope([:user, Meal])
    end
  
    def destroy
      @meal = Meal.find(params[:id])
      @meal.destroy
      redirect_to user_meals_path
      authorize @meal
    end
  end