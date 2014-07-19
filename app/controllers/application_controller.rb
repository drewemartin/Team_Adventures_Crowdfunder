class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to sessions_new_path
    end
  end
  

  private 
  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id] 	
  end

  def funding_count(project_rewards)
    ary = []
    project_rewards.each do |rewards|
      ary.push(rewards.pledges.count * rewards.amount)
    end
    return ary.reduce(:+)
  end

  helper_method :current_user
  helper_method :funding_count
end
