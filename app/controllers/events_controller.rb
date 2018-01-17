class EventsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.all
    end

    def show
    end

    def new
        @event = Event.new
    end

    def edit
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

        redirect_to edit_event_path(@event)
    end

    def destroy

    end

    private

    def set_event
        @event = Event.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        params.require(:event).permit(:title, :location, :duration, :chosen_slot)
    end
  end