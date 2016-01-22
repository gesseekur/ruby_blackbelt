class LendersController < ApplicationController
  def index
  end

  def create
  	lender = Lender.new(lender_params)
  		if lender.save 
  			redirect_to '/sessions'
  		else 
  			flash[:errors] = lender.errors.full_messages
  			redirect_to :back
  		end 
  end

  def show 
  	@lender = Lender.find(params[:id])
  	@borrowers = Borrower.all
  	@borrowered = History.where(lender_id: params[:id])
  end


  
  private
  	def lender_params
  		params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  	end	
end
