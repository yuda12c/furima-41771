class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @buy_information = BuyInformation.new
  end

  def create
    @buy_information = BuyInformation.new(information_params)
    if @buy_information.valid?
      pay_item
      @buy_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:buy_information).permit(:postal_code, :place_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_out
    redirect_to root_path if @item.buy.present?
  end

end