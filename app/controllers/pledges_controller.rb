class PledgesController < ApplicationController
  def create
  		user = User.find(params[:user_id])
  		reward = Reward.find(params[:reward_id])
  		@pledge = Pledge.new(user:user,reward:reward)
  		respond_to do |format|
  			if @pledge.save
  				total = total_money_raised(@pledge)
          pledge_amount = @pledge.reward.amount
  				format.json{render json: {total_pledged: total,pledge_amount: pledge_amount}}
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
