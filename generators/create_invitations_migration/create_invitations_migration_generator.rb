class CreateInvitationsMigrationGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate' 
    end
  end

  def file_name
    "create_invitations"
  end

end
