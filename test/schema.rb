ActiveRecord::Schema.define(:version => 0) do 
  create_table :users, :force => true do |t| 
    t.string :login 
    t.integer :inviter_id
    t.integer :invitation_limit #, :default => 5
    t.timestamps 
  end
    
  # Creating invitations table
  create_table :invitations do |t|
    t.integer :sender_id
    t.string :recipient_email
    t.string :token
    t.datetime :sent_at
    #t.boolean :used, :default => false      
    t.timestamps
  end 
end