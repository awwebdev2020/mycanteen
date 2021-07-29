class MealsController < ApplicationController

  def home
    @meals = Meal.all
  end
    
  def index
    @meals = Meal.all
  end

  def show
    set_item
   #authorize @meal
    @booking = Booking.new
    #@meals= Meal.find(params[:id])
  end  
  
  def new
    @meal = Meal.new
   # authorize @meal
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
    set_item
    #@meal = Meal.find(params[:id])
    @meal.update(meal_params)
    @meal.save
    
    redirect_to meal_path(@meal)
  end
    
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    #render new
  end
  
  private

  def set_item
    @meal = Meal.find(params[:id])
  end


  def meal_params
    params.require(:meal).permit(:name, :rating, :price, :description, :user_id)
  end
end
