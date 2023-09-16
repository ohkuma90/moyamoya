class WorriesController < ApplicationController

  def index
    @worries2 = current_user.worries.where(category_id: 2).includes(:user)
    @worries3 = current_user.worries.where(category_id: 3).includes(:user)
    @worries4 = current_user.worries.where(category_id: 4).includes(:user)
    @worries5 = current_user.worries.where(category_id: 5).includes(:user)
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
