class HistoriesController < ApplicationController
  def create
  	lender = Lender.find(params[:lender_id])
  	borrower = Borrower.find(params[:borrower_id])
  	if lender.money > (params[:amount].to_f) && borrower.money > (params[:amount].to_f)
	  	history = History.create(amount: params[:amount], lender_id: params[:lender_id], borrower_id: params[:borrower_id])
	  	borrower.update(raised:(params[:raised].to_f) + (params[:amount].to_f))
	  	lender.update(money: lender.money - (params[:amount].to_f))
		borrower.update(money: borrower.money - (params[:amount].to_f))
	  	redirect_to :back
	else 
		flash[:msg] = "Insufficient funds/Over the amount the Borrower needs"
		redirect_to :back
	end
	  
  end

end
