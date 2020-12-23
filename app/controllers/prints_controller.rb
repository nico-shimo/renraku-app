class PrintsController < ApplicationController
  def index
  end

  def new
  end

  private

  def print_params
    params.require(:print).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
