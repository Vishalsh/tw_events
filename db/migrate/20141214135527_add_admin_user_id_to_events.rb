class AddAdminUserIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :admin_user_id, :integer
  end

  def self.down
    remove_column :events, :admin_user_id
  end
end
