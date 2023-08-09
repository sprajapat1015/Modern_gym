class TrainerCoach < ApplicationRecord
  resourcify

  has_many :courses, dependent: :destroy 

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :phone_number, presence: true 
  validates :expertise, presence: true 


   after_create :assign_default_role

  def assign_default_role
    self.add_role(:coach) if self.roles.blank?
  end
end

