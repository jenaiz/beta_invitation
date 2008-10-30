class AddInvitationsToUserMigrationGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end

  def file_name
    "add_beta_invitations_to_user"
  end

end
