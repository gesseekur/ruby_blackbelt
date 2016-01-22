class Lender < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :money, :presence => true 
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  belongs_to :borrower 
  has_many :histories, dependent: :destroy
  has_many :borrowers, through: :histories,  dependent: :destroy
end
