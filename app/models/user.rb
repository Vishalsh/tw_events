class User < ActiveRecord::Base
  validates_presence_of :uid, :name, :email

  has_and_belongs_to_many :topics, join_table: :speakers_topics
  has_and_belongs_to_many :voted_topics, class_name: Topic, join_table: :voters_topics
  has_many :registered_topics, class_name: Topic, foreign_key: :registerer_id

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
