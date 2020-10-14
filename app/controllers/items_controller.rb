class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :category_parent_array, only: [:new, :create, :edit, :update]
  def index
  end


  def show
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
      flash.now[:alert] = 'エラー : 必須項目を入力してください。'
      render :new
    end
  end
  
  def purchase
  end

  # 親カテゴリが選択された後に動くアクション
  def get_category_children
    # 選択された親カテゴリに紐づく子カテゴリの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  # 子カテゴリが選択された後に動くアクション
  def get_category_grandchildren
    # 選択された子カテゴリに紐づく孫カテゴリの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :brand, :size_id, :state_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, item_images_attributes: [:url]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil)
  end
end
