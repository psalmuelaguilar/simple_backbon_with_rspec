require 'spec_helper'
describe Tag do
  it "should save" do 
    tag = FactoryGirl.build(:tag)
    tag.save! 
    expect(tag).to be_true
  end
  it "should be unique regardless of case" do 
    tag = Tag.create(name: 'test')
    tag2 = Tag.new(name: tag.name.upcase)
    tag2.save.should == false
  end

end