class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    past
    future
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Your event was created'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Your event was updated'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def invite
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: 'You are already on the list'
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_invite
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: 'You are no longer attending this event'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date_time, :location)
  end

  def past
    @events_past = Event.past.all
  end
  
  def future
    @event_future = Event.future.all
  end
end
