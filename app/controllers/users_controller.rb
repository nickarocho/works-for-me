class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "You have successfully signed up!"
        redirect_to events_path
      else
        render "users/new"
    end
  end

  def show
    @events = current_user.events_attending
  end

  def dashboard
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end