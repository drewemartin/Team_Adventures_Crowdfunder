class ProjectsController < ApplicationController
  before_action :set_restaurant

  def index
  	 @projects = Project.all
  	 @categories = Category.all
  end

  def show
  end

  def create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @Project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:project).permit(:title, :description, :goal, :start_time, :end_time, :picture_url)
    end
end
