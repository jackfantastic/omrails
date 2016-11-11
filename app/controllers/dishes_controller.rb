class DishesController < ApplicationController

  # GET /dishes
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  def show
    @dish = Dish.find(params[:id])
  end

  # GET /dishes/new
  def new
    @dish = current_user.dishes.find(params[:id])
  end

  # GET /dishes/1/edit
  def edit
    @dish = current_user.dishes.new
  end

  # POST /dishes
  def create
    @dish = current_user.dishes.new(dish_params)
      if @dish.save
        redirect_to @dish, notice: 'Dish was successfully created.'
      else
        render :new 
      end
  end

  # PATCH/PUT /dishes/1
  def update
      @dish = current_user.dishes.find(params[:id])
      if @dish.update(dish_params)
        redirect_to @dish, notice: 'Dish was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /dishes/1
  def destroy
    @dish = current_user.dishes.find(params[:id])
    @dish.destroy
      redirect_to dishes_url, notice: 'Dish was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:restaurant, :location, :name, :cost, :ingredient)
    end
end
