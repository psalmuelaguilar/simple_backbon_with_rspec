class Posttag < ActiveRecord::Base
  attr_accessible :post_id, :tag_id
  #associations
  belongs_to :tag
  belongs_to :post

  #validations
  validate :check_post_value?
  validate :check_tag_value?


  #custom validation
  private 

  def check_post_value?
    errors.add(:post, "is invalid") if self.post == nil 
  end

  def check_tag_value?
    errors.add(:tag, "is invalid") if self.tag == nil 
  end




end
