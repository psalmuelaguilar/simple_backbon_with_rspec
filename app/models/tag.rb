class Tag < ActiveRecord::Base
  attr_accessible :name
  #association 
  has_many :posttags
  has_many :posts, through: :posttags

  #validation 
  validates :name, :uniqueness => {:case_sensitive => false}


end
