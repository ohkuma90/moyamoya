class TodosController < ApplicationController
  
  def index
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :category_id, :memo, :priority_id).merge(user_id: current_user.id)
  end

end
