class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(create_params)
    @event.admin_id = current_user.id
    if @event.save
      redirect to event_path(@event.id)
    else
      puts "="*30
      puts @event.errors.full_messages
      puts "="*30
      render :new
    end
  end

  def create_params
    params.require(:event).permit(
    :start_date,
    :duration,
    :title,
    :description,
    :price,
    :location,
    :admin_id)
  end
end
