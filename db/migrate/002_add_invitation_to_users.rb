class AddInvitationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :invitation_id, :integer
    add_column :users, :invitation_limit, :integer
  end

  def self.down
    remove_column :users, :invitation_limit
    remove_column :users, :invitation_id
  end
end
