class Membership < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy 
  has_many :users, through: :payments, dependent: :destroy 


  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  

  
end
