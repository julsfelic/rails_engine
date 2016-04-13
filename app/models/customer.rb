class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true
  has_many :invoices
end
