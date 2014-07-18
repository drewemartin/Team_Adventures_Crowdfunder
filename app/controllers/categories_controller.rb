class CategoriesController < ApplicationController
 before_action :set_category, only: [:show, :edit, :update, :destroy]
 before_filter :ensure_logged_in, :only => [:new, :create]



  def index
  	
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category.new(category_params)
    if @category.save 
      redirect_to project_path(@category.id)
    else
      render 'new'
    end
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
