class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def purchase
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :price, item_images_attributes: [:url])
  end
  
end
