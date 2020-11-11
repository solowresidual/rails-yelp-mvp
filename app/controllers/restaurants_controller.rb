class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end


#     Prefix Verb URI Pattern                                       Controller#Action
#    restaurant_reviews POST /restaurants/:restaurant_id/reviews(.:format)     reviews#create
# new_restaurant_review GET  /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
#           restaurants GET  /restaurants(.:format)                            restaurants#index
#                       POST /restaurants(.:format)                            restaurants#create
#        new_restaurant GET  /restaurants/new(.:format)                        restaurants#new
#            restaurant GET  /restaurants/:id(.:format)                        restaurants#show
