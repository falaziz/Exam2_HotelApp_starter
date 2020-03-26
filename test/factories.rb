FactoryBot.define do
  
  factory :user do
      first_name "Alex"
      last_name "Heimann"
      phone "1231231234"
      email "test@example.com"
      active true
  end

  # factory blueprint for room
  factory :room do
    room_number 237
    room_type "Suite"
    booked false
  end

  # factory blueprint for booking
  factory :booking do
    association :user
    association :room
    start_date Date.today
    end_date Date.today + 1
  end
end