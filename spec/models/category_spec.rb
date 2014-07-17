require 'rails_helper'

describe Category do
  it "it must have a factory" do
  	expect(FactoryGirl.create(:category
  		)).to be_valid
  end
  it "it must have  a name" do
  	expect(FactoryGirl.build(:category, name: nil)).to_not be_valid
  end

  it "it has many projects" do
  	category = FactoryGirl.create(:category)
  	expect(category).to respond_to(:projects)
  end

end
