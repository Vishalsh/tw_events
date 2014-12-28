class RemoveCategoryIdFromTopics < ActiveRecord::Migration

  def self.up
    remove_column :topics, :category_id
  end

  def self.down
    add_column :topics, :category_id, :integer
  end
end
