class ApprovedsController < ApplicationController
    def create
        Approved.create(user: current_user, availability_id: params[:availability_id])
        redirect_to profile_path
    end

    def destroy
        Approved.find_by(user: current_user, availability_id: params[:id]).destroy
        redirect_to profile_path
    end
end