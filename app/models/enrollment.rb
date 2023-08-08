class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :enrollment_date, presence:  true
end
