ActiveRecord::Schema.define(:version => 0) do 
  create_table :users, :force => true do |t| 
    t.string :id  
    t.string :login 
    t.timestamp 
  end 
end