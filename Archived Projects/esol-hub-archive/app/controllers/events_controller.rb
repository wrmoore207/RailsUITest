# app/controllers/events_controller.rb
class EventsController < ApplicationController
  include Secured
  
    def index
      # simple_calendar expects an attribute (by default, `start_time`)
      @events = Event.all
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to events_path, notice: "Event created successfully."
      else
        render :new
      end
    end
  
    # Optional: edit, update, destroy actions if you want to manage events further
    def edit
      @event = Event.find(params[:id])
    end
  
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to events_path, notice: "Event updated successfully."
      else
        render :edit
      end
    end

    def show
      @event = Event.find(params[:id])
    end
  
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path, notice: "Event deleted successfully."
    end
  
    private
  
    def event_params
      params.require(:event).permit(:name, :description, :start_time)
    end
  end
  