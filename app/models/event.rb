class Event < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :thumb => "100x100>" }

  validates :name, :event_date, :submission_close_date, :voting_close_date, :description, presence: true
  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => /\Aimage\/.*\Z/ },
                       :size => { :in => 0..500.kilobytes }
end
