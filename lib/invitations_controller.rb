class InvitationsController < ApplicationController
  
  protect_from_forgery :only => [:update, :destroy]
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    debugger
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      if logged_in?
        InvitationMailer.deliver_invitation(@invitation, signup_url(@invitation.token))
        flash[:notice] = "Thank you, invitation sent."
        redirect_to projects_url
      else
        flash[:notice] = "Thank you, we will notify when we are ready."
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end
end
