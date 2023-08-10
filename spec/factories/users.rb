require 'factory_bot'
FactoryBot.define do
  factory :user do
    first_name {'Sumit'}
    last_name {'Prajapat'}
    phone_number {'123456789'}
    date_of_birth {"2023-08-03"}
    email {"user345@gmail.com"}
    gender {"male"}
    password {"111111"}
  end
end

