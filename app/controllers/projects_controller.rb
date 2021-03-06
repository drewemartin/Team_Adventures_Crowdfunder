class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_logged_in, except: [:index, :show]

  def index
  	@projects = if params[:search]
      Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%").order(created_at: :desc).page(params[:page])
      elsif params[:category_id]
        @category = Category.find(params[:category_id])
        @category.projects.order(created_at: :desc).page(params[:page])
      else
        Project.order('projects.created_at DESC').page(params[:page])
      end  

     @hash_amount_project = {}
     @projects.each{|project|
      @hash_amount_project[project.id] = calculate_sum_of_pledges(project)
     }

  	 @categories = Category.all
  	 @most_recent_project = Project.most_recent_five

     @total_money_raised = get_total_money_raised

    respond_to do |format|
      format.html
      format.js
    end


  end

  def new
    @project = Project.new
  end

  
  def show
    @rewards = @project.rewards
    puts "printing rewards" 
    @sum_of_amount = calculate_sum_of_pledges(@project)
    @current_user_amount_pledged = get_user_pledge_for_the_project
    @total_supporters = get_total_supporters
    if current_user
      @review = @project.reviews.build
    end
  end  

  def create
    @project = Project.new(project_params)
    @project.user = current_user
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

    def get_user_pledge_for_the_project
        all_pledges = @project.pledges
        all_pledges.each do |pledge|
           if pledge.user == current_user
              return pledge.reward.amount
           end
        end
        return 0
    end

    def get_total_supporters
      @project.pledges.count
    end 

    def calculate_sum_of_pledges(project)
        rewards = project.rewards
        sum_of_amount = rewards.inject(0) do |sum, reward|
            num_of_pledges = reward.pledges.count
            sum_of_the_reward = num_of_pledges * reward.amount
            sum + sum_of_the_reward
        end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
  

    def project_params
      params.require(:project).permit(:title, :description, :goal, :start_time, :end_time, :image, :category_id, rewards_attributes: [:amount, :description, :_destroy])
    end
end
