class CompleteController < ApplicationController
  
def update
  @todo = Todo.find(params[:id])
  if @todo.complete?
    @todo.save
    redirect_to todos_path, notice: 'ToDo added to List'
  else
    @todo.complete = false
    @todo.save
    redirect_to todos_path, notice: 'ToDo removed from List'
  end

  def list
    @todos = Todo.all
  end
end

private

  def movie_params
    params.require(:todo).permit(:description, :completed)
  end
