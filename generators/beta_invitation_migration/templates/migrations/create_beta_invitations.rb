class CreateBetaInvitations < ActiveRecord::Migration
  def self.up
    
    # Adding invitation limit to user model
    add_column :users, :inviter_id, :integer
    add_column :users, :invitation_limit, :integer, :default => 5
    add_column :users, :invitation_limit_infinite, :boolean, :default => true
    
    # Creating invitations table
    create_table :invitations do |t|
      t.integer :sender_id
      t.string :recipient_email
      t.string :token
      t.datetime :sent_at
      t.text :message     
      t.timestamps
    end
  end
  
  def self.down
    remove_column :users, :inviter_id
    remove_column :users, :invitation_limit
    remove_column :users, :invitation_limit_infinite
    
    drop_table :invitations
  end
end