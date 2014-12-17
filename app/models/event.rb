class Event < ActiveRecord::Base
  has_attached_file :avatar, :styles => {:thumb => "100x100>"}

  validates :name, :event_date, :submission_close_date, :voting_close_date, :description, presence: true

  validates_attachment :avatar, :presence => true,
                       :content_type => {:content_type => /\Aimage\/.*\Z/},
                       :size => {:in => 0..500.kilobytes}

  validate :event_presence

  belongs_to :admin_user

  def event_presence
    event = Event.find_by(name: name, event_date: event_date)
    errors.add(:name, 'and date already present') unless event.nil?
  end
end
