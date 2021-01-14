class ApplicationController < ActionController::Base
  
  include ApplicationHelper
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_own = user.books.where(status: true).count
    @count_notyet = user.books.where(status: false).count
    @count_favorites = user.favoring.count
  end

end
