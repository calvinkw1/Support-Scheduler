class ShiftController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
