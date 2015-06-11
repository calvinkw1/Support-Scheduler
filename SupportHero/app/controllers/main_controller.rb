class MainController < ApplicationController
  def index
    shift = Shift.find_by date: Date.today
    @user = User.find shift.user_id
  end
end
