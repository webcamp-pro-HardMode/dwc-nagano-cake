class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params)
    @genre = Genre.find(params[:genres_id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def creat
    @item = Item.new(item_params)
    @item.save
    redirect_back(fallback_location: root_path)
  end

  def update
    @item = Item.find(params[:id])
    @item.save(item_params)
    redirect_to admin_item_path(@item)
  end

  private
  def item_params
    params.reqire(:item).permit(:image, :name, :introduction, :genres_id, :price, :status)
  end
end
