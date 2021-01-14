class BooksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show,:edit,:update,:destroy]
  
  
  
  def show
    
    if @book.status == false
      @status = "未所持"
    else
      @status = "所有済み"
    end
  end
  
  def new
    @book = current_user.books.build
  end
  
  def create
    @book = current_user.books.build(book_params)
    
    if @book.save
      flash[:success] = '登録しました'
      redirect_to @book
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    
    if @book.update(book_params)
      flash[:success] = '書籍情報を更新しました'
      redirect_to @book
    else
      flash.now[:danger] = '書籍情報が更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    flash[:success] = '書籍を削除しました'
    redirect_to("/books/own")
  end
  
  def own
    @books = current_user.books.where(status: true)
    counts(current_user)
  end
  
  def notyet
    @books = current_user.books.where(status: false)
    counts(current_user)
  end
  
  def likes
    
    @books = current_user.favoring
    counts(current_user)
  end
  
  
  private

  # Strong Parameter
  def book_params
    params.require(:book).permit(:title,:library,:memo,:image,:status)
  end
  
  
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
end
