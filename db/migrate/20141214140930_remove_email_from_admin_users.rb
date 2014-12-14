class RemoveEmailFromAdminUsers < ActiveRecord::Migration
  def self.up
    remove_column :admin_users, :email
  end

  def self.down
    add_column :admin_users, :email, :string
  end
end
