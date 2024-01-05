class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
