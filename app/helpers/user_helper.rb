module UserHelper
  def attended_events
    @user.attended_events.all
  end

  def created_events
    @user.created_events.all
  end
end
