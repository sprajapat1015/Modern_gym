FactoryBot.define do
  factory :course do
    # Define course attributes
    association :trainer_coach

    description { "Example Course" }
    start_time { Time.now }
    end_time { Time.now + 1.hour }
    capacity { 10 }
    class_name { "yoga" }
    association :trainer_coach, factory: :trainer_coach
  end

end
