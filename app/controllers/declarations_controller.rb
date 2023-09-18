class DeclarationsController < ApplicationController

  def index
    @declarations = Declaration.includes(:user).order('created_at DESC')
  end

  def new
    @declaration = Declaration.new
  end

  def create
    @declaration = Declaration.new(declaration_params)
    if @declaration.save
      redirect_to declarations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @declaration = Declaration.find(params[:id])
    if current_user.id == @declaration.user_id
      @declaration.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private

  def declaration_params
    params.require(:declaration).permit(:declaration, :comment).merge(user_id: current_user.id)
  end
end
