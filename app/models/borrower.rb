class Borrower < ActiveRecord::Base
  has_secure_password
  belongs_to :lender 
  has_many :histories, dependent: :destroy
  has_many :lenders, through: :histories, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :purpose, :money, :presence => true 
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  def sum_raised  
  	 History.where(borrower:self).sum :amount
  end
end
