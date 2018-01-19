class EventsController < ApplicationController
    before_action :authorize, except: [:show]
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    
    def index
        @events = current_user.events
    end
    
    def show
    end
    
    def new
        @event = Event.new
    end
    
    def edit
        @availabilities = Event.find(params[:id]).availabilities
        @invite_url = "http://#{request.host}:3000/events/#{params[:id]}/join" 
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

    def slots
        set_event
    end

    def join
        current_user.events_attending << Event.find(params[:id])
        redirect_to profile_path
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end
  
    def event_params
        params.require(:event).permit(:title, :location, :duration, :chosen_slot)
    end

  end