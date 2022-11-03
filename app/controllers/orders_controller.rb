class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :item_buyer, only: [:index, :create]
  before_action :correct_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def item_buyer
    redirect_to root_path if user_signed_in? && @item.buyer
  end

  def correct_item
    redirect_to root_path if @item.user.id == current_user.id
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
