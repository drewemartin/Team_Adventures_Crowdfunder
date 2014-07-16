require 'rails_helper'

describe Project do
	it "it has a valid factory" do
		expect(FactoryGirl.create(:project)).to be_valid
	end
  it "title must be not be empty" do
  	expect(FactoryGirl.build(:project, title: nil)).to_not be_valid
  end
  it "title must be greater than 3 char." do
  	expect(FactoryGirl.build(:project,title: "ab")).to_not be_valid
  end
  it "goal must be an integer" do
  	expect(FactoryGirl.build(:project,goal:"lala")).to_not be_valid
  end
  it "goal must be greater than zero" do
  	expect(FactoryGirl.build(:project,goal: -1)).to_not be_valid
  end
  it "goal must not be empty" do
  	  	expect(FactoryGirl.build(:project,goal:nil)).to_not be_valid
  end
  it "start_time must not be empty" do
  	  	  	expect(FactoryGirl.build(:project,start_time:nil)).to_not be_valid
  end
  it "start_time must be at least 6 hours from time.now" do
     project = FactoryGirl.build(:project)
     project.start_time = DateTime.now + 5.hours
     expect(project).to_not be_valid
  end
  it "end_time must be 2 days greater than star_time" do
  	project = FactoryGirl.build(:project)
  	project.start_time = DateTime.now + 7.hours
  	project.end_time = project.start_time + 1.day
  	expect(project).to_not be_valid
  end
  it "it should belong to a category" do
  	project = FactoryGirl.create(:project)
  	expect(project).to respond_to(:category)
  end
  it "it should belong to a user" do
  	project = FactoryGirl.create(:project)
  	expect(project).to respond_to(:user)
  end
  it "description should not be empty" do
  	expect(FactoryGirl.build(:project, description:nil)).to_not be_valid
  end
  it "description should greater than 3 char." do
  	expect(FactoryGirl.build(:project, description:"eat")).to_not be_valid
  end

end
