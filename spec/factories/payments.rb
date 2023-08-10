FactoryBot.define do
  factory :payment do
    payment_date {Date.today}
    amount { 200 }
    membership
    user
  end
end

