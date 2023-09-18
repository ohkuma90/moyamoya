class WorriesController < ApplicationController
  before_action :show_check, only: :show
  before_action :set_worry, only: [:show, :destroy]

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

  def show
  end

  def destroy
    if current_user.id == @worry.user_id
      @worry.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_worry
    @worry = Worry.find(params[:id])
  end

  def worry_params
    params.require(:worry).permit(:text, :category_id, :title).merge(user_id: current_user.id)
  end

  def show_check
    @worry = Worry.find(params[:id])
    if @worry.user_id != current_user.id
      redirect_to root_path
    end
  end

end
