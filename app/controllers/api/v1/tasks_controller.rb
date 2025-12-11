class Api::V1::TasksController < ApplicationController
  before_action :load_task, only: [:update, :destroy]

  def index
    tasks = Task.all.order(created_at: :desc)

    render json: tasks
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(
      :description,
      :done
    )
  end


  def load_task
    @task = Task.find(params[:id])
  end
end
