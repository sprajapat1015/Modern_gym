class Membership < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy 
  has_many :users, through: :payments, dependent: :destroy 


  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  # validate :check_start_end_date_for_status

  # def check_start_end_date_for_status
  #   if start_date  <= Date.today
  #     errors.add(:start_date, "aren't less than from today.")      
  #   end
  # end
  

  
end
