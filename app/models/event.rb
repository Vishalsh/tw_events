class Event < ActiveRecord::Base
  has_attached_file :avatar, :styles => {:thumb => "100x100>"}

  validates :name, :event_date, :submission_close_date, :voting_close_date, :description, presence: true

  validates_attachment :avatar,
                       :content_type => {:content_type => /\Aimage\/.*\Z/},
                       :size => {:in => 0..100.kilobytes}

  validate :event_presence, on: :create

  belongs_to :admin_user

  has_many :talks, class_name: Topic

  def event_presence
    event = Event.find_by(name: name, event_date: event_date)
    errors.add(:name, 'and Event date are already present') unless event.nil?
  end
end
