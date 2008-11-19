require 'test/unit'
require File.dirname(__FILE__) + '/test_helper.rb'

class BetaInvitationTest < Test::Unit::TestCase
  # Replace this with your real tests. 
  def setup
    User.purge
    Invitation.purge
    
    @admin = Factory(:user, :login => 'admin', :admin => true)
    @user = Factory(:user, :login => 'user', :admin => false, :invitation_limit => 10)

    @invitation = Invitation.new(:recipient_mail => 'prueba@example.com')    
  end
  
  def test_user_invitation_limit
    assert_equal 5, @admin.invitation_limit    
    assert_equal nil, @admin.inviter_id
    assert_equal 10, @user.invitation_limit
  end
  
  def test_invitation
    assert_equal 'prueba@example.com', @invitation.recipient_mail
  end
  
  def test_recipient_is_registered
    assert true
  end
  
  def test_sender_has_invitations
    assert true
  end
  
  def test_generate_token
    assert true
  end
  
  def test_decrement_sender_count
    assert true
  end
end
