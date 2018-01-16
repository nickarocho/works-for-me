class EventsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_house, only: [:show, :edit, :update, :destroy]

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

    end

    def update

    end

    def destroy

    end

end