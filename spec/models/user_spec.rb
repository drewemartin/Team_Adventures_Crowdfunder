require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(FactoryGirl.create(:user)).to be_valid
	end
	it "is invalid without username" do
		expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
	end
	it "username is invalid less than 2 characters" do
		expect(FactoryGirl.build(:user, username: "a")).to_not be_valid
	end
	it "is invalid without email" do 
		expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
	end
	it "is invalid with identical email" do
		firstUser = FactoryGirl.create(:user)
		expect(FactoryGirl.build(:user, email: firstUser.email)).to_not be_valid
	end
	it "has many projects" do
		user = FactoryGirl.create(:user)
		expect(user).to respond_to(:projects)
	end
	it "has many pledges" do
		user = FactoryGirl.create(:user)
		expect(user).to respond_to(:pledges)
	end
end

