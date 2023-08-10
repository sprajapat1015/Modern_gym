FactoryBot.define do
  factory :membership do
    class_name {'Yoga'}
    start_date {Date.today}
    end_date {Date.today}
    status {"Active"}
    user


    
  end
end

