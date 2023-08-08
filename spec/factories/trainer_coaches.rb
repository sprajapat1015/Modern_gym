require 'factory_bot'
FactoryBot.define do
  factory :trainer_coach do
    first_name {'Sumit'}
    last_name {'Prajapat'}
    phone_number {'123456789'}
    expertise {"yoga"}
  end
end



