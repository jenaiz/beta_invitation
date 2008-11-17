class BetaInvitationMigrationGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      
      m.migration_template 'migrations/create_beta_invitations.rb', 'db/migrate'
      
    end
  end

  def file_name
    "create_beta_invitations"
  end

end