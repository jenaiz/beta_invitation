class InvitationMailer < ActionMailer::Base
   
  def invitation(invitation, signup_url, from, subject)
    subject    subject #'Invitation'
    recipients invitation.recipient_email
    from       from
    body       :invitation => invitation, :signup_url => signup_url, :message => invitation.message
    invitation.update_attribute(:sent_at, Time.now)
  end

end
