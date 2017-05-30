class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:index, :update]

  def index
    @tasks
    @tasks = current_user.tasks.tagged_with(params[:tag]) if params[:tag]
    @tasks = current_user.tasks.important if params[:important]
    @tasks = current_user.tasks.starred if params[:starred]
    @tasks = current_user.tasks.finished if params[:finished]
    @tasks = current_user.tasks.scheduled if params[:scheduled]
    @tasks = current_user.tasks.today if params[:today]
  end

  def show; end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to root_url, notice: 'Task successfully created!'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    redirect_to tasks_url, notice: 'Task successfully deleted!' if @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = current_user.tasks
  end

  def task_params
    params.require(:task).permit(:title, :description, :finished, :important, :starred, :all_tags, :start_date, :due_date)
  end
end
