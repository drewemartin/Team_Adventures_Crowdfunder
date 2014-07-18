require 'rails_helper'

describe PledgesController do
	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new pledge to the database" do
				# pledge = FactoryGirl.build(:pledge) 
				project = FactoryGirl.create(:project)
				user = project.user
				reward = FactoryGirl.create(:reward, :project => project)

				expect{
					post :create, pledge: { :user_id => user.id, :reward_id => reward.id } 
					}.to change(Pledge, :count).by(1)
			end
			xit "the method 'total_money_pledged' should return the udated total amount pledged for the project"
			xit "respond with json"
	end
	end
end