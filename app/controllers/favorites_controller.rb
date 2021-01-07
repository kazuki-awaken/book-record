class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    current_user.favor(book)
    # flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    current_user.dissolve(book)
    # flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
