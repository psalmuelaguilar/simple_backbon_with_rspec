class Post < ActiveRecord::Base
  attr_accessible :author_id, :content, :permalink, :teaser, :title
  

  #validations
  validates :author_id, :content, :title, presence: true
  validates :title, uniqueness: true
  
  #callbacks
  before_save :copy_content
  before_save :generate_permalink
  
  #relationships
  belongs_to :author
  has_many :posttags
  has_many :tags, through: :posttags

  #callback methods
  def copy_content
    content = self.content
    self.teaser = content.split[0..49].join(" ")
  end

  def generate_permalink
    self.permalink = self.title.split.insert(0, DateTime.now.to_date.strftime("%d-%m-%Y")).flatten.join("-") 
  end

end
