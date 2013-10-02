class ProjectsController < ApplicationController

  def index
    @projects=Project.all
    @projects = Project.order('projects.created_at DESC').page(params[:page])

  end

  def show
    @project=Project.find(params[:id])
  end

  def new
    @project=Project.new
  end

  def nav_state
    @nav = :projects
  end

  # def create 
  #   @project = Project.new(params[:project])
  #   if @project.save
  #     redirect_to @project
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @project = Project.find(params[:id])
  #   if @project.update(params)
  #     redirect_to @project
  #   else
  #     render :edit
  #   end
  # end

  
end