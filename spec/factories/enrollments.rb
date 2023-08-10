require 'factory_bot'
FactoryBot.define do
  factory :enrollment do
    id {1}
    enrollment_date {Date.today}
    course_id {1}
    user
  end
end

