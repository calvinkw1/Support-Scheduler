class ShiftsController < ApplicationController
  before_action :all_users, only: [:new, :edit, :update]

  def index
    # adjusted this query to only show shifts 1 month from today
    @user_shifts = Shift.joins(:user).where(date: Date.today..Date.today.next_month)
  end

  def new
    @shift = Shift.new
    # @names = []
    # User.all.each do |user|
    #   @names << user.name
    # end
  end

  def create
    year = params[:shift][:"date(1i)"]
    month = params[:shift][:"date(2i)"]
    day = params[:shift][:"date(3i)"]
    dateStr = "#{year}/#{month}/#{day}"
    name = params[:shift][:user_id]
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
    @user = User.find @shift.user_id
    @shift.avail = params[:shift][:avail]
    if @shift.avail == false
      # logic here to get another employee to fill in the shift
      @names.delete(@user.name)
      newUser = User.find_by name: @names.sample
      # check to see if last unavailable shift was > 30 days ago
      if Date.today - newUser.last_skipped_shift > 30
        @shift.user_id = newUser.id
        @shift.avail = true
        @shift.save
        @user.last_skipped_shift = @shift.date
        @user.save
        redirect_to shifts_path
      else
        flash.now[:alert] = "Your last skipped shift was less than 30 days ago! (#{@user.last_skipped_shift})"
        render :edit
      end
    else
      @shift.avail = true
      @shift.save
      redirect_to shifts_path
    end
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
