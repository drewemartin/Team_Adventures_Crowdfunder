class ReviewsController < ApplicationController

  before_filter :load_project

  def show
  	@review = Review.find(params[:id])
  end

  def new
  end

  def create
  	@review = @project.reviews.build(review_params)
  	@review.user_id = current_user.id

  	respond_to do |format|
      if @review.save
        format.html {redirect_to project_path(@project.id), notice: "Your comment was saved"}
        format.js { notice: "Your comment was saved"}
      else
        format.html {render 'projects/show', alert: "there was a an error"}
        format.js {}
      end
    end
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
end
