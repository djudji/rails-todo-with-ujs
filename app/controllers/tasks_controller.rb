class TasksController < ApplicationController
	def index
		@tasks = current_user.tasks
	end
	def new
	end
	def edit
	end
	def create

	end
	def delete
	end
end
