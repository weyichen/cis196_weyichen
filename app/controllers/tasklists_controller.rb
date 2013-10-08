class TasklistsController < ApplicationController
  def new
    @task_list = Tasklist.new
  end
  
  def index
    @task_lists = Tasklist.all
  end
  
  def create
    @task_list = Tasklist.new(tasklist_params)
    if @task_list.save
      redirect_to tasklists_path
    else
      render 'new'
    end
  end
  
  def edit
    @task_list = Tasklist.find(params[:id])
  end
  
  def update
    @task_list = Tasklist.find(params[:id])
    if @task_list.update_attributes(params[:task_list])
      redirect_to tasklists_path(@task_list.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @task_list = Tasklist.find(params[:id])
    @task_list.destroy
    redirect_to tasklists_path
  end
  
  def show
    @task_list = Tasklist.find(params[:id])
  end
  
  private
  
  def tasklist_params
    params.require(:task_list).permit(:title, :name)
  end
  
end