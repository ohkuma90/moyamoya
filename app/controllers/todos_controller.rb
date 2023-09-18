class TodosController < ApplicationController
  
  def index
    @todos2 = current_user.todos.where(category_id: 2).includes(:user)
    @todos3 = current_user.todos.where(category_id: 3).includes(:user)
    @todos4 = current_user.todos.where(category_id: 4).includes(:user)
    @todos5 = current_user.todos.where(category_id: 5).includes(:user)
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

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :category_id, :memo, :priority_id).merge(user_id: current_user.id)
  end

end
