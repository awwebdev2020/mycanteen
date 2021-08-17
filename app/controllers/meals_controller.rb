class MealsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]
  
  def show
    set_item
    authorize @meal
    @booking = Booking.new
    #@meals= Meal.find(params[:id])
  end  

   
  def index
    @meals = policy_scope(Meal)
  end

  
  def new
    @meal = Meal.new
    authorize @meal
  end
    
  def create
    @meal = Meal.new(meal_params)
    if @meal
      @meal.save
      redirect_to meal_path(@meal)
    else
      render new  
    end
    authorize @meal
  end
    
  def edit
    set_item
    #@meal = Meal.find(params[:id])
    @meal.save
    authorize @meal
  end
    
  def update
    set_item
    #@meal = Meal.find(params[:id])
    @meal.update(meal_params)
    @meal.save
    authorize @meal
    redirect_to meal_path(@meal)
  end
    
  def destroy
    set_item
    #@meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
    authorize @meal
  end
  
  private

  def set_item
    @meal = Meal.find(params[:id])
  end


  def meal_params
    params.require(:meal).permit(:name, :rating, :price, :description, :day, :date, :user_id)
  end
end
