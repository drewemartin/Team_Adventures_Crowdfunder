class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index

  	@projects = if params[:search]
        Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
      else
        Project.all
      end
  	 
  	 @categories = Category.all
  	 @most_recent_project = Project.most_recent_five
     @projects = @projects.order(created_at: :desc).page(params[:page])
  end

  def new
    @project = Project.new
  end

  
  def show
  end  

  def create
    @project = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
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
