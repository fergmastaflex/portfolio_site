class ProjectsController < ApplicationController
  before_filter :find_project, only: [:edit, :show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def edit

  end

  def new
    @project = Project.new
  end

  def show

  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, notice: 'Your project is created'
    else
      render actions: 'new'
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Your project is updated'
    else
      render actions: 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: 'Your project was deleted'
  end

  def find_project
    @project = Project.find(params[:id])
  end
end