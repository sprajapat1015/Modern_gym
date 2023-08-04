class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy 
  has_many :users, through: :enrollments, source: :user, dependent: :destroy 

  belongs_to :trainer_coach


  # accepts_nested_attributes_for :enrollments

end
