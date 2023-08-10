require 'factory_bot'
FactoryBot.define do
  factory :course do
    association :trainer_coach

    class_name { "yoga" }
    description { "Example Course" }
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }
    capacity { 20 }
    trainer_coach
    association :trainer_coach, factory: :trainer_coach
  end

end
