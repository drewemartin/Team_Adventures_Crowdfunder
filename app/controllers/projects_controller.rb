class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  	 @projects = Project.all
  	 @categories = Category.all
  	 @most_recent_project = Project.most_recent_five
  end

  def show
  	
  end

  def create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :goal, :start_time, :end_time, :picture_url)
    end
end
