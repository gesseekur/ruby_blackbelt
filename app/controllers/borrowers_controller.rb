class BorrowersController < ApplicationController
  def index
  end

  def create
  	borrower = Borrower.new(borrower_params)
  		if borrower.save 
  			redirect_to '/sessions'
  		else 
  			flash[:errors] = borrower.errors.full_messages
  			redirect_to :back
  		end 
  end

  def show 
    @borrower = Borrower.find(params[:id])
    @lender = History.where(borrower_id: params[:id])
  end

  private
  	def borrower_params
  		params.require(:borrower).permit(:first_name, :last_name, :email, :password, :money, :purpose, :description)
  	end	
end
