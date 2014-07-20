class Category < ActiveRecord::Base
	has_many :projects
	
	validates :name, :presence => true

	def get_money_raised_for_the_category
		projects.inject(0){|sum, project|
			rewards = project.rewards
			rewards.each{ |reward|
				sum += reward.pledges.count * reward.amount
			}
			sum
		}
	end
end
