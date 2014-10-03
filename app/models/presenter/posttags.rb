module Presenter
  class Posttags
    ATTRIBUTES =[
      :id, :name, :tag_id
    ]
    def self.parse(post)

      data = {}
      post.tags      
      ATTRIBUTES.each do |a|
        binding.pry
        data[a] = posttag.send(a)
      end
      data
    end
  end
end
