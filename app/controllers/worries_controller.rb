class WorriesController < ApplicationController

  def index
  end

  def new
    @worry = Worry.new
  end

  def create
    @worry = Worry.new(worry_params)
    if @worry.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def worry_params
    params.require(:worry).permit(:text, :category_id, :title).merge(user_id: current_user.id)
  end

end
