class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  #[helper]をcontrollerで呼び出せるようにするためのコード
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end