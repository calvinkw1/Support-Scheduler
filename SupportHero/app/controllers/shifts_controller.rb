class ShiftsController < ApplicationController
  def index
    # @shifts = Shift.all
    @user_shifts = Shift.joins(:user)
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.create shift_params
  end

  def show
  end

  def edit
  end

  private
  def shift_params
    params.require(:shift).permit(:date)
  end

end
