class TodoItemsController < ApplicationController

	def new
		@todo = TodoItem.new
	end

	def create
	 logger.info params

	 @todo = TodoItem.new(todo_items_params)

	 if @todo.save 
	 	redirect_to todo_item_path(@todo)
	 else
	 	render :new
	 end
	end

	def show
		@todo = TodoItem.find(params[:id])
		# render json: @todo
	end

	def index
		@todos = TodoItem.all
		
	end

	private

	def todo_items_params
		params.require(:todo_item).permit(:name, :desc)
	end
end
