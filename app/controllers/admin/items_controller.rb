class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
  end

  def edit
  end

  def creat
    @item = Item.new(item_params)
    @item.save
    redirect_back(fallback root_path)
  end

  def update
  end

  private
  def item_params
    params.reqire(:item).permit(:image, :name, :introduction, :genres_id)
  end
end
