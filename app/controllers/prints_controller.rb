class PrintsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prints = Print.includes(:user).order('created_at DESC')
  end

  def new
    @print = Print.new
  end

  def create
    @print = Print.new(print_params)
    if @print.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def print_params
    params.require(:print).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
