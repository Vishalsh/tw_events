FactoryGirl.define do

  factory :valid_talk, class: Topic do
    title 'abcde'
    category 'workshop'
    description 'Hello world'
  end

end
