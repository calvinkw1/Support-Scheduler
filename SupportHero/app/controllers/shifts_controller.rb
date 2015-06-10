class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    @user_shifts = Shift.joins(:user)
  end

  def new
    @shift = Shift.new
    @names = []
    User.all.each do |user|
      @names << user.name
    end
  end

  def create
    dateStr = params.values[2].values[0]
    name = params.values[2].values[1]
    if dateStr
      date_split = dateStr.split('/')
      # using the Holiday gem to check for observed US holidays
      date = Date.civil(date_split[2].to_i, date_split[0].to_i, date_split[1].to_i)
      holiday = Holidays.on(date, :us)
    end
    if date && name && holiday
      user = User.where('name=?', params.values[2].values[1])
      shift = Shift.create(date: date, user_id: user[0].id, holiday: holiday, weekend: date.saturday? || date.sunday?)
      if shift.save
        redirect_to shifts_path
      else
        render :edit
      end
    end
  end

  def show
  end

  def edit
    @shift = Shift.find params[:id]
  end

  private
  # unable to get this private params method to modify
  # the params value of user_id as it looks like the
  # permit method creates a new hash and modifying that
  # hash doesn't change the actual values

  # def shift_params
  #   user = User.where(name: params.values[2].values[1])
  #   params.values[2].values[1] = user[0].id
  #   params.require(:shift).permit(:date, :user_id)
  #   binding.pry
  # end

end
