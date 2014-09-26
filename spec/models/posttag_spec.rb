require 'spec_helper'
describe Posttag do 
  describe "Creation" do
    it 'should fail if post_id is invalid' do
      Tag.create(name:'test')
      pt = FactoryGirl.build(:posttag)
      expect{pt.save!}.to raise_error
    end
    it 'if tag_id is invalid' do 
      FactoryGirl.create(:post)
      pt = FactoryGirl.build(:posttag)
      expect{pt.save!}.to raise_error
    end
  end
  it { should belong_to :post }
  it { should belong_to :tag }

end