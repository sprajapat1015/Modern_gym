class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :membership

  validates :payment_date, presence: true
  validates :amount, presence: true
end
