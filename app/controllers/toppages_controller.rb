class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to own_books_path
    end
  end
end
