class BetaInvitationGenerator < Rails::Generator::NamedBase 
  def manifest 
    record do |m| 
      m.migration_template 'migration:migration.rb', "db/migrate", {:assigns => beta_invitation_local_assigns, 
        :migration_file_name => "add_beta_invitation_fields_to_#{custom_file_name}" 
      } 
    end 
  end 
end

private  
  def custom_file_name 
    custom_name = class_name.underscore.downcase 
    custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names 
  end 
def beta_invitation_local_assigns 
  returning(assigns = {}) do 
    assigns[:migration_action] = "add" 
    assigns[:class_name] = "add_beta_invitation_fields_to_#{custom_file_name}" 
    assigns[:table_name] = custom_file_name 
    assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("invitation_id", "integer")] 
    assigns[:attributes] << Rails::Generator::GeneratedAttribute.new("invitation_limit", "integer")
  end 
end 
