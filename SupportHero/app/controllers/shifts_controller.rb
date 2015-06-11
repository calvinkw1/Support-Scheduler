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
    dateStr = params.values[2].values[0]
    name = params.values[2].values[1]
    user = User.where('name=?', params.values[2].values[1])
    if dateStr
      date_split = dateStr.split('/')
      date = Date.civil(date_split[2].to_i, date_split[0].to_i, date_split[1].to_i)
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
    @user = User.find params.values[2]
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

end
