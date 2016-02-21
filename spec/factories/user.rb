FactoryGirl.define do

  factory :valid_user, class: User do
    uid 1
    provider 'google'
    name 'Sachin Tendulkar'
    email 'sachinten@cricket.com'
  end

end