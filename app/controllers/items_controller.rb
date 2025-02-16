class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(:title, :detail, :price, :image, :category_id, :state_id, :delivery_id, :place_id, :dispatch_id)
  end
  
end
