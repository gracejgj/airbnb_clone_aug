class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update]

  layout 'user'

  def show
    @user = User.find(params[:id])
    @listings = Listing.is_available #check listing.rb
    @bookings = @user.bookings
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_path(current_user), notice: 'User profile was successfully updated.'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end

  #
  # def set_user
  #   @user = User.find(params[:id])
  # end  [mins - 1:48:00]

end
