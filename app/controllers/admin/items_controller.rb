class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: '商品を登録しました'
    else
      @genres = Genre.all
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: '商品を更新しました'
    else
      @genres = Genre.all
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_status)
  end
end
