class Invitation < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  has_one :recipient, :class_name => 'User'
  
  validates_presence_of :recipient_email
  #validates_uniqueness_of :recipient_email  
  
  validate :recipient_is_not_registered
  #validate :recipient_is_yet_registered
  validate :sender_has_invitations, :if => :sender
  
  before_create :generate_token
  before_create :decrement_sender_count, :if => :sender  
  
  def use!
    self.used = true
    self.save
  end
  
private
  
  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered.' if User.find_by_email(recipient_email)
  end
  
  def recipient_is_yet_registered
    #errors.add :recipient_email, 'is registered yet.' if Invitation.find_by_recipient_email(recipient_email)
    flash[:error] = 'Email is registered yet.' if Invitation.find_by_recipient_email(recipient_email)
  end
  
  def sender_has_invitations
    unless sender.invitation_limit_infinite && sender.invitation_limit > 0
      errors.add_to_base 'You have reached your limit of invitations to send.'
    end
  end
  
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
  
  def decrement_sender_count
    sender.decrement! :invitation_limit unless sender.invitation_limit_infinite
  end
end