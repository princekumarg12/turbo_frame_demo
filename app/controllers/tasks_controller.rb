class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
    if @task.update(task_params)
      # redirect_to tasks_path, notice: "Task was successfully updated."
      redirect_to @task, turbo_frame: "task_details"
      # render turbo_stream: turbo_stream.replace("task_details", partial: "tasks/show", locals: { task: @task })

    else
      render :edit
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
