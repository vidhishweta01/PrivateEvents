module UserHelper
  def attended_events
    @user.attended_events.all
  end
end