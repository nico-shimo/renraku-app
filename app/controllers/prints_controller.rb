class PrintsController < ApplicationController

  def index
    @prints = Print.includes(:user)
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
