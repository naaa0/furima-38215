class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) 
    if @item.update(item_params)
      render action: :show
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_bearer_id, :region_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
