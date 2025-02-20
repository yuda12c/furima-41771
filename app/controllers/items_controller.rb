class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path,notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity 
    end
  end

private

  def item_params
    params.require(:item).permit(:title, :detail, :price, :image, :category_id, :state_id, :delivery_id, :place_id, :dispatch_id).merge(user_id: current_user.id)
  end
  
end
