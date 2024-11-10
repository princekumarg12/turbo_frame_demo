class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      # redirect_to tasks_path, notice: "Task was successfully updated."
      redirect_to @task, turbo_frame: "task_details"
      # render turbo_stream: turbo_stream.replace("task_details", partial: "tasks/show", locals: { task: @task })

    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end