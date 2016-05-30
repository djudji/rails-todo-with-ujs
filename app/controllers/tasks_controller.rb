class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]
	before_action :set_tasks, only: [:index, :update]
	
	def index
	end

	def show
	end

	def new
		@task = Task.new
		respond_to do |format|
      format.html
      format.js
    end
	end

	def edit
	end

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			redirect_to root_url, notice: "Task successfully created!"
			#render :index
		else
			render :new
		end
	end

	def update
		if @task.update(task_params)
			redirect_to root_url
			#redirect_to @task, notice: "Task successfully updated!"
		else
			render :edit
		end
	end

	def destroy
		if @task.destroy
			redirect_to tasks_url, notice: "Task successfully deleted!"
		end
	end

	private

		def set_task
			@task = Task.find(params[:id])
		end

		def set_tasks
			@tasks = current_user.tasks
		end

		def task_params
			params.require(:task).permit(:title, :description, :finished, :important, :starred, :all_tags)
		end
end
