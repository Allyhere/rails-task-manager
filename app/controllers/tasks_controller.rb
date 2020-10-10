class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id]) # before_action
  end

  def new
    @task = Task.new
  end

  def create
    # params[:task] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}

    @task = Task.new(task_params)
    @Task.save

    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id]) # before_action
  end

  def update
    # @task = Task.find(params[:id]) # before_action
    @Task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id]) # before_action
    @Task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
