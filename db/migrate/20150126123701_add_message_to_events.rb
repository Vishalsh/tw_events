class AddMessageToEvents < ActiveRecord::Migration

  def self.up
    add_column :events, :message, :string
  end

  def self.down
    remove_column :events, :message
  end
end
