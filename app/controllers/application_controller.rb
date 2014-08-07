class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
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

  def get_total_money_raised
    Project.all.inject(0){|sum, project|
      project.rewards.each{|reward|
        sum += reward.pledges.count * reward.amount
      }
      sum
    }
  end

  def get_successfully_fund_projects
    Project.all.inject([]){|arr, project|
      if(project.end_time.to_date >= DateTime.now().to_date and calculate_sum_of_pledges(project) >= project.goal)
        arr << project
      end
      arr
    }
  end

  def calculate_sum_of_pledges(project)
    rewards = project.rewards
    sum_of_amount = rewards.inject(0) do |sum, reward|
        num_of_pledges = reward.pledges.count
        sum_of_the_reward = num_of_pledges * reward.amount
        sum + sum_of_the_reward
    end
  end



  helper_method :current_user
  helper_method :funding_count
  helper_method :get_total_money_raised
  helper_method :get_successfully_fund_projects
end
