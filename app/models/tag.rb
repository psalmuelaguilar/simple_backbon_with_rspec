class Tag < ActiveRecord::Base
  attr_accessible :name
  #association 
  has_many :posttags
  has_many :posts, through: :posttags

  #validation 
  validates :name, :uniqueness => {:case_sensitive => false}, presence: true
  # before_save :downcaseTagName

  # def downcaseTagName
  #   self.name = self.name.downcase
  # end



end
