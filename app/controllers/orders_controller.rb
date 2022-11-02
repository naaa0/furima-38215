class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  
  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
