class BetaInvitationControllerGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.file 'controllers/invitations_controller.rb', 'app/controllers/invitations_controller.rb'
      m.file 'controllers/home_controller.rb', 'app/controllers/home_controller.rb'
      
      #helpers
      m.file 'helpers/invitations_helper.rb', 'app/helpers/invitations_helpers.rb'
            
      #views
      m.directory "app/views/invitations"      
      m.file 'views/invitations/new.html.erb', 'app/views/invitations/new.html.erb'
      
      m.directory "app/views/invitation_mailer"            
      m.file 'views/invitation_mailer/invitation.erb', 'app/views/invitation_mailer/invitation.erb'

      m.directory "app/views/home"            
      m.file 'views/home/beta.html.erb', 'app/views/home/beta.html.erb'
       
      #models or mailers
      m.file 'helpers/invitations_helper.rb', 'app/helpers/invitations_helpers.rb'
            
    end
  end

end