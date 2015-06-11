class ShiftsController < ApplicationController
  before_action :all_users, only: [:new, :edit, :update]

  def index
    @shifts = Shift.all
    @user_shifts = Shift.joins(:user)
  end

  def new
    @shift = Shift.new
    # @names = []
    # User.all.each do |user|
    #   @names << user.name
    # end
  end

  def create
    year = params.values[2].values[0]
    month = params.values[2].values[1]
    day = params.values[2].values[2]
    dateStr = "#{year}/#{month}/#{day}"
    name = params.values[2].values[3]
    user = User.where('name=?', name)
    if dateStr
      date = Date.civil(year.to_i, month.to_i, day.to_i)
    end
    if date && name
      shift = Shift.create(date: date, user_id: user[0].id, holiday: date.holiday?, weekend: date.saturday? || date.sunday?)
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
    @user = User.find params[:format]
    if @names.include?(@user.name)
      @names.delete(@user.name)
    end
    # @names = []
    # User.all.each do |user|
    #   @names << user.name
    # end
  end

  def update
    @shift = Shift.find params[:id]
    user = User.where('name=?', params.values[3].values[1])
    @shift.user_id = user[0].id
    @shift.avail = params.values[3].values[2]
    @shift.save
    redirect_to shifts_path
  end

  def swapShifts
    user = User.find_by name: params[:user]
    origShift = Shift.find params[:origShiftID]
    newShift = Shift.find params[:newShiftID]
    oldUser = newShift.user_id
    newShift.user_id = user.id
    newShift.save
    origShift.user_id = oldUser
    origShift.save
    redirect_to shifts_path
  end

  def get_shifts
    user = User.find_by name: params[:name]
    @shifts = user.shifts
    respond_to do |format|
      format.json { render json: @shifts}
    end
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
  
  def all_users
    @names = []
    User.all.each do |user|
      @names << user.name
    end
  end

  def swap_shifts

  end

end
