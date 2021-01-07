class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :only_login_user, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
    
  
  def show
    @books = @user.books.where(status: true)
    counts(@user)
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報が更新できませんでした'
      render :edit
    end
    
  end

  def destroy
    
    @user.destroy
    flash[:success] = '退会しました'
    redirect_to ("/")
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def only_login_user
    if current_user.id !=  params[:id].to_i
      redirect_to("/books/own")
    end
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
