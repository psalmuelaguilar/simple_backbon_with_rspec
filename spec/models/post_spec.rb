require 'spec_helper'
require 'lib/post'
describe Post do 
  describe "Attributes" do 
    it 'has a content' do 
      FactoryGirl.create(:post).should be_valid
    end
    it 'is invalid without a author_id' do 
      FactoryGirl.build(:post, author_id: nil).should_not be_valid
    end
    it 'is invalid without a content' do
      FactoryGirl.build(:post, content: nil).should_not be_valid
    end
    it "does not allow duplicate titles per post" do 
      title = FactoryGirl.create(:post)
      FactoryGirl.build(:post, title: title.title).should_not be_valid
    end

    it 'creates a teaser from the first fifty words of content' do
      post = FactoryGirl.create(:post)
      post.teaser.should_not == nil
    end
    it 'teaser should not be more than fifty words' do 
      post = FactoryGirl.create(:post, content: ("om nom nom" * 100))
      post.teaser.split.count.should <= 50
    end
    it 'automatically generates permalink' do 
      post = FactoryGirl.create(:post)
      post.permalink.should == post.title.split.insert(0, DateTime.now.to_date.strftime("%d-%m-%Y")).flatten.join("-") 
    end

  end

  describe "Associations" do
    it {should belong_to(:author)}
    it {should have_many(:tags).through(:posttags)}
    it {should have_many(:posttags)}


  end


end