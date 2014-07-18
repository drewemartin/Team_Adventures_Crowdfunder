class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_logged_in, except: [:index, :show]

  def index

  	@projects = if params[:search]
        Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%").order(created_at: :desc).page(params[:page])
      elsif params[:category_id]
        category = Category.find(params[:category_id])
        category.projects.order(created_at: :desc).page(params[:page])
      else
        Project.order('projects.created_at DESC').page(params[:page])
      end
	 
  	 @categories = Category.all
  	 @most_recent_project = Project.most_recent_five
    # @projects = @projects.order(created_at: :desc).page(params[:page])

     puts @projects.count
    respond_to do |format|
      format.html
      format.js
    end


  end

  def new
    @project = Project.new
    #@project.rewards.build
  end

  
  def show
    @rewards = @project.rewards
    @sum_of_amount = @rewards.inject(0) do |sum, reward|

      num_of_pledges = reward.pledges.count
      sum_of_the_reward = num_of_pledges * reward.amount
      sum + sum_of_the_reward
    end
  end  

  def create
    @project = Project.new(project_params)
    #!!!!!!!need to be change
    @project.user = User.first
    respond_to do |format|
      if @project.save
        format.html { redirect_to  project_path(@project), notice: 'Project was successfully created.' }
      else
        format.html { render :new }
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
      params.require(:project).permit(:title, :description, :goal, :start_time, :end_time, :picture_url, :category_id, rewards_attributes: [:amount, :description, :_destroy])
    end
end
