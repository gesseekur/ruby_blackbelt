class SessionsController < ApplicationController
  def index
  end

  def create 
  	if lender = Lender.find_by(email:params[:email])
  		if lender && lender.authenticate(params[:password])
  			session[:lender_id] = lender.id 
  			redirect_to "/lenders/#{lender.id}"
  		else 
  			flash[:msg] = "Invalid user/password combination"
  			redirect_to :back
  		end 
  	elsif borrower = Borrower.find_by(email:params[:email])
  		if borrower && borrower.authenticate(params[:password])
  			session[:borrower_id] = borrower.id
  			redirect_to "/borrowers/#{borrower.id}"
  		else 
  			flash[:msg] = "Invalid user/password combination"
  			redirect_to :back
  		end  
  	else 
  		flash[:msg] = "You need an email and password to enter"
  		redirect_to :back
  	end
  end

  def destroy
  	session[:lender_id] = nil;
    session[:borrower_id] = nil;
  	redirect_to '/sessions'
  end 
end
