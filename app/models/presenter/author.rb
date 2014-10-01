module Presenter
  class Author

    ATTRIBUTES = [
      :id,
      :name
    ]

    def self.parse(author)
      data = {}
      ATTRIBUTES.each do |attribute|
        data[attribute] = author.send(attribute)
      end
      data
    end
  end
end
