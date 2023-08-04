class Membership < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy 
  has_many :users, through: :payments, dependent: :destroy 



  

  
end