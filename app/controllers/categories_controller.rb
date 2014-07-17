class CategoriesController < ApplicationController
 before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @projects = if params[:search]
        Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
      else
        Project.all
      end
  	 
  	 @categories = Category.all 
     @projects = @projects.order(created_at: :desc).page(params[:page])
  	
  end

  def show

  	@projects = if params[:search]
        Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
      else
        Project.all
      end
  	 
  	@categories = Category.all 	
    @category = Category.find(params[:id])
    @most_recent_project = @category.projects.most_recent_five
    @per_category = @category.projects
    @projects = @projects.order(created_at: :desc).page(params[:page])
  end

  def new
    @category = Category.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

end