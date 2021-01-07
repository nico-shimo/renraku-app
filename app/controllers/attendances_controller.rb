class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.includes(:user).order('created_at DESC')
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.valid?
      @attendance.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:presence_id, :breakfast_id, :bath_id, :temperture_id).merge(user_id: current_user.id)
  end
end
