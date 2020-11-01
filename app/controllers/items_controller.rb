class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :category_parent_array, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :baria_user, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
    @purchases = Purchase.all
  end


  def show
    @item_images = @item.item_images
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def new
    @item = Item.new
  # input要素の追加。
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id), notice: '出品が完了しました'
    else
      flash.now[:alert] = 'エラー : 必須項目を入力してください。'
      render :new
    end
  end

  def purchase
  end

  def edit
     @item.item_images.new
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '出品内容を更新しました'
    else
      flash.now[:alert] = 'エラー : 必須項目を入力してください。'
      render :edit
    end
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
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
  
  def baria_user
    redirect_to root_path, alert: '出品者以外は編集・削除が出来ません' unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
    @item_images = @item.item_images
  end
end
