class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_item,only: [:edit]
  before_action :find_item,only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def correct_item
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_bearer_id, :region_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
