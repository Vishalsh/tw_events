class DropCategories < ActiveRecord::Migration

  def self.up
    drop_table :categories
  end

  def self.down
    create_table :categories do |t|
      t.string :name
      t.string :time_in_min
    end
  end
end
