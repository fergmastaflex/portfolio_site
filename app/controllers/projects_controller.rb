class ProjectsController < ApplicationController
  before_filter :find_project, only: [:edit, :show, :update, :destroy]

  def index
    @projects = Project.includes(:pictures)
  end

  def edit

  end

  def new
    @project = Project.new
    @project.pictures.build
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
  
  def new_picture
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.new
  end

  def create_picture
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.new(params[:picture])
    if @picture.save
      redirect_to project_path(@project), notice: "Image successfully uploaded"
    else
      flash.now.alert = 'Image could not be saved. See errors below'
      render :new_picture
    end
  end
end