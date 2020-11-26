# frozen_string_literal: true

class TodoItemsController < ApplicationController
  before_filter :get_todo, only: %i[edit show destroy]
  def new
    @todo = TodoItem.new
  end

  def create
    logger.info params

    @todo = TodoItem.new(todo_items_params)

    if @todo.save
      flash[:notice] = 'TODO Saved'
      redirect_to todo_item_path(@todo)
    else
      render :new
    end
  end

  def show
    # render json: @todo
  end

  def index
    @todos = TodoItem.all
  end

  def edit
    @todo = TodoItem.find(params[:id])
  end

  def update
    @todo = TodoItem.find(params[:id])
    if @todo.update(todo_items_params)
      flash[:notice] = 'Todo Updated'
      redirect_to todo_item_path @todo
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = 'Todo deleted successfully'
    redirect_to todo_items_path
  end

  private

  def todo_items_params
    params.require(:todo_item).permit(:name, :desc)
  end

  def get_todo
    @todo = TodoItem.find(params[:id])
  end
end
