class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  validates :description, length: {minimum: 4}
  validates :amount, numericality: {greater_than: 0}
  validate :amount_unique_with_same_project_id

  private 
  def amount_unique_with_same_project_id

  	    has_duplication = false
  		if !Reward.all.empty?
	  		id = project.id
	  		reward_set = Reward.where(:project_id => id) 
	  		reward_set.each {|a| if a.amount == amount
	  			has_duplication= true
	  			return errors.add(:amount, "this amount is equal to a preivously set amount") 
	  		end
	  		}
	  	end
  end
end
