class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)

    @genre.save
    # ジャンルの一覧画面へリダイレクト
    redirect_to admin_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)

  end

end
