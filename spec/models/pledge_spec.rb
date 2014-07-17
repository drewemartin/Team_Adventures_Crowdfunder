require 'rails_helper'

describe Pledge do
  it "should belongs to a user" do
  	pledge = FactoryGirl.create(:pledge)
  	expect(pledge).to respond_to(:user)
  end
  it "should belongs to a reward" do
  	  	pledge = FactoryGirl.create(:pledge)
  	expect(pledge).to respond_to(:reward)
  end
end
