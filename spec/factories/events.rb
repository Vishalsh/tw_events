FactoryGirl.define do

  factory :valid_event_1, class: Event do
    name 'Xconf'
    event_date DateTime.parse '22/12/2014'
    submission_close_date DateTime.parse '27/12/2014'
    voting_close_date DateTime.parse '31/12/1991'
    description 'XConf in gurgaon'
    avatar_file_name 'logo.png'
    avatar_content_type 'image/png'
    avatar_file_size 34092
  end

  factory :valid_event_2, class: Event do
    name 'Vodqa'
    event_date DateTime.parse '22/12/2014'
    submission_close_date DateTime.parse '27/12/2014'
    voting_close_date DateTime.parse '31/12/1991'
    description 'XConf in gurgaon'
    avatar_file_name 'logo.png'
    avatar_content_type 'image/png'
    avatar_file_size 34092
  end

  factory :invalid_event, class: Event do
    name ''
    event_date DateTime.parse '22/12/2014'
    submission_close_date DateTime.parse '27/12/2014'
    voting_close_date DateTime.parse '31/12/1991'
    description 'XConf in gurgaon'
    avatar_file_name ''
    avatar_content_type 'image/png'
    avatar_file_size 34092
  end

end
