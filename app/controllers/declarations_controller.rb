class DeclarationsController < ApplicationController
  def index
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

  private

  def declaration_params
    params.require(:declaration).permit(:declaration, :comment).merge(user_id: current_user.id)
  end
end
