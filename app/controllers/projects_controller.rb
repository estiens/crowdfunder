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
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to my_projects_path
  end
end