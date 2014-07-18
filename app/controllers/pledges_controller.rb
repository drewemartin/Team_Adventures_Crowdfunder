class PledgesController < ApplicationController
  def create
  		user = User.find(params[:user_id])
  		reward = Reward.find(params[:reward_id])
  		p user
  		p reward
  		@pledge = Pledge.new(user:user,reward:reward)
  		p @pledge
  		respond_to do |format|
  			if @pledge.save
  				total = total_money_raised(@pledge)
  				p total
  				format.json{render json: total}
  			else
  				format.json{render json: @pledge}
  			end
  		end
  end

  private
  def total_money_raised(pledge)
  		project = pledge.reward.project
  		rewards = project.rewards
  		rewards.inject(0){|sum, reward|
  			sum_for_the_reward = reward.pledges.count * reward.amount
  			sum + sum_for_the_reward
  		}
  end

end
