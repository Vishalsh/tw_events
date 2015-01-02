class DropSettings < ActiveRecord::Migration

  def self.up
    drop_table :settings
  end

  def self.down
    create_table :settings do |t|
      t.string :name
      t.string :value
    end
  end
end
