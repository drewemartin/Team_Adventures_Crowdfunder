require 'rails_helper'
require 'faker'

describe Reward do
 # it "it must have a factory" do
 # 	expect(FactoryGirl.create(:reward)).to be_valid
 # end
 it " project id must not be empty" do
 	reward = FactoryGirl.create(:reward)
 	expect(reward).to respond_to(:project)
 end
 it "description must longer than 3 char." do
 	expect(FactoryGirl.build(:reward, description:"eat")).to_not be_valid
 end
 it "description must not be empty" do
 	expect(FactoryGirl.build(:reward, description:nil)).to_not be_valid
 end
 it "amount must be greater than zero" do
 	expect(FactoryGirl.build(:reward, amount:0)).to_not be_valid
 end
 it "amount must not be empty" do
 	expect(FactoryGirl.build(:reward, amount:nil)).to_not be_valid
 end
 it "amounts with same project_id must be unique" do
 	project = FactoryGirl.create(:project)
 	reward1 = FactoryGirl.create(:reward, project: project, amount:2)
 	expect(FactoryGirl.build(:reward, project: project, amount:2)).to_not be_valid
 end

 it "belongs to a project" do
 	reward = FactoryGirl.create(:reward)
 	expect(reward).to respond_to(:project)
 end
 it "has many pledges" do
 	reward = FactoryGirl.create(:reward)
 	expect(reward).to respond_to(:pledges)
 end


end
