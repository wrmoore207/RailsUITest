class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /calendar
  def calendar
    @events = Event.all.order(:date)

    @today = Date.current
    @month = params[:month]&.to_i || @today.month
    @year = params[:year]&.to_i || @today.year
  end

  # app/controllers/events_controller.rb
  def events_on_date
    @date = Date.parse(params[:date])
    @events = Event.where(date: @date)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "day_event_modal",
          partial: "events/day_event_modal",
          locals: { events: @events, date: @date }
        )
      end
      format.html do
        render partial: "events/day_event_modal", locals: { events: @events, date: @date }
      end
    end
  end


  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/1/edit
  def edit
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html do
        if turbo_frame_request?
          render partial: "events/form_modal", locals: { event: @event }
        else
          render :new
        end
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "new_event_modal",
          partial: "events/form_modal",
          locals: { event: @event }
        )
      end
    end
  end
  

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to events_path, notice: "Event was successfully created." }
        format.turbo_stream # invokes create.turbo_stream.erb
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_event_modal",
            partial: "events/form_modal",
            locals: { event: @event }
          )
        end
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Set event for actions requiring an existing event
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters
  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :location)
  end
end
