class TrainerCoach < ApplicationRecord
  resourcify

  has_many :courses, dependent: :destroy 

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :phone_number, presence: true 
  validates :first_name, presence: true 
end
