class CreateInvitations < ActiveRecord::Migration
  def self.up
    
    # Adding invitation limit to user model
    add_column :users, :invitation_id, :integer
    add_column :users, :invitation_limit, :integer, :default => 5
    
    # Creating invitations table
    create_table :invitations do |t|
      t.integer :sender_id
      t.string :recipient_email
      t.string :token
      t.datetime :sent_at
      t.boolean :used, :default => false      
      t.timestamps
    end
  end
  
  def self.down
    remove_column :users, :invitation_limit
    remove_column :users, :invitation_id
    
    drop_table :invitations
  end
end
