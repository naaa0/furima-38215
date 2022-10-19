class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_bearer_id, :region_id, :delivery_date_id)
  end
end
