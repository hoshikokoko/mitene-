class Staff::NotificationsController < ApplicationController
  
  def index
    @notifications = current_staff.passive_notifications
  end
  
  def update
    notification = Notification.find(params[:id]) 
    if notification.update(is_checked: true) 
      redirect_to notifications_path
    end
  end
end
