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

  	if @review.save
  		redirect_to project_path(@project.id), notice: "thanks, your comment was saved"
  	else
  		render 'projects/show'
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
