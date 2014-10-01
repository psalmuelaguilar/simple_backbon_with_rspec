class Posttag < ActiveRecord::Base
  attr_accessible :post_id, :tag_id, :name
  attr_accessor :name
  #associations

  belongs_to :post
  belongs_to :tag, autosave: true
  accepts_nested_attributes_for :tag

  #validations
  # validate :check_post_value?
  # validate :check_tag_value?


  #callbacks
  # before_validation :find_id

  def autosave_associated_records_for_tag
    if new_tag = Tag.find_or_create_by_name(self.name)
      self.tag = new_tag
    else
      self.tag = tag if self.tag.save!
    end
  end
  #custom validation
  private 

  def check_post_value?
    errors.add(:post, "is invalid") if self.post == nil 
  end

  def check_tag_value?
    errors.add(:tag, "is invalid") if self.tag == nil 
  end





end
