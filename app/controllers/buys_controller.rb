class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_sold
  before_action :redirect_if_owner

  def index
    @buy_information = BuyInformation.new
  end

  def create
    @buy_information = BuyInformation.new(buy_information_params)
 
    if @buy_information.valid?
    item = Item.find(buy_information_params[:item_id]) 
    price = item.price

    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: price,  
        card: buy_information_params[:token],    
        currency: 'jpy'                 
      )


      @buy_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_information_params
    params.require(:buy_information).permit(:postal_code, :place_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def redirect_if_owner
    if @item.user == current_user  
      redirect_to root_path
    end
  end

end