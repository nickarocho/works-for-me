class EventsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    
    def index
        @user_events = Event.where(:user_id => current_user)
    end
    
    def show
    end
    
    def new
        @event = Event.new
    end
    
    def edit
        @availabilities = Event.find(params[:id]).availabilities.first
    end
    
    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save
            redirect_to edit_event_path(@event)
        else
            render :new
        end
        
    end
    
    def update
        @event = Event.find(params[:id])
        @event.update_attributes(event_params)
        dt = params[:date]
        st = params[:start_time]
        et = params[:end_time]
        @event.availabilities.create({
            start: Time.new(dt[:year], dt[:month], dt[:day], st[:hour].to_i + (params[:start_day_or_night] == "pm" && st[:hour] != "12" ? 12 : 0 ), st[:minute]).utc,
        end: Time.new(dt[:year], dt[:month], dt[:day], et[:hour].to_i + (params[:end_day_or_night] == "pm" && et[:hour] != "12" ? 12 : 0 ), et[:minute]).utc
    })
        redirect_to edit_event_path(@event)
    end

    def destroy
        @event.destroy
        redirect_to events_url, notice: 'Event was successfully destroyed.'
        # @availability.destroy
        # redirect_to events_url, notice: 'Possible time deleted.'

    end

    private

    def set_event
        @event = Event.find(params[:id])
    end
  
    def event_params
        params.require(:event).permit(:title, :location, :duration, :chosen_slot)
    end

  end