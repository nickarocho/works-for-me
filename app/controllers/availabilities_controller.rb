class AvailabilitiesController < ApplicationController

    def index
        @availabilities = Availability.all
    end

    def new
        @availability = Availability.new
    end

    def destroy
        @availability = Availability.find(params[:id])
        @availability.destroy
        redirect_to edit_event_path(params[:eventid]), notice: 'Possible time deleted.'
    end

end