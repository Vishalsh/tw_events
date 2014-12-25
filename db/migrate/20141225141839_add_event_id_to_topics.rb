class AddEventIdToTopics < ActiveRecord::Migration

  def self.up
    add_column :topics, :event_id, :integer
  end

  def self.down
    remove_column :topics, :event_id
  end
end
