class DropSessions < ActiveRecord::Migration

  def self.up
    drop_table :sessions
  end

  def self.down
    create_table :sessions do |t|
      t.string :session_id
      t.string :data
    end
  end

end
