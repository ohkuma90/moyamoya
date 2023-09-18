class TodosController < ApplicationController
  before_action :todo_check, only: [:show, :edit]
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @todo.user_id
      @todo.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :category_id, :memo, :priority_id).merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_check
    @todo = Todo.find(params[:id])
    if @todo.user_id != current_user.id
      redirect_to root_path
    end
  end

end
