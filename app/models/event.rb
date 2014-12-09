class Event < ActiveRecord::Base
  validates :name, :event_date, :submission_close_date, :voting_close_date, presence: true
end
