class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user_lender 
  	Lender.find(session[:lender_id]) if session[:lender_id]
  end 

  def current_user_borrower
	Borrower.find(session[:user_id]) if session[:borrower_id]
  end 

  helper_method :current_user_lender
  helper_method :current_user_borrower

end
