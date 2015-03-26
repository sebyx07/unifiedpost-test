FactoryGirl.define do
  factory :user do
    first_name "first name"
    last_name "last name"
    sequence :email do |n|
      "bla#{n}@bla.com"
    end
    country_id "RO"
    city "Timisoara"
    confirm false
  end

  trait :confirmed do
    confirm true
  end

end
