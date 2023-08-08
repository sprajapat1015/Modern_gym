class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy 
  has_many :users, through: :enrollments, source: :user, dependent: :destroy 

  belongs_to :trainer_coach

  validates :class_name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :capacity, presence: true


  # accepts_nested_attributes_for :enrollments

end
