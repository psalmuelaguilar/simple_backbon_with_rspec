module Presenter
  class Tag
    ATTRIBUTES =[
      :id, :name
    ]
    def self.parse(tag)
      data = {}
      ATTRIBUTES.each do |a|
        data[a] = tag.send(a)
      end
      data
    end
  end
end
