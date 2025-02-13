class ItemsController < ApplicationController 

  def index
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item 
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def item_params
    params.require(:item).permit(:title, :price, :image, :category_id, :status_id, :delivery_id, :place_id, :dispatchday_id)
  end
  
end
