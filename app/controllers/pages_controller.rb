class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @meals = Meal.all
  end

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save
    redirect_to meal_path(@meal)
  end

  def edit
    @meal = Meal.find(params[:id])
    @meal.save
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    @meal.save

    redirect_to meal_path(@meal)
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end

  def show
    @meals= Meal.find(params[:id])
  end

  

  def meal_params
    params.require(:meal).permit(:name, :rating, :price, :description, :user_id)
  end
end
