module Presenter
  class Post

    ATTRIBUTES = [
      :id,
      :title,
      :permalink,
      :content,
      :teaser,
      :author_id,
      :created_at
    ]

    def self.parse(post)
      data = {}
      ATTRIBUTES.each do |attribute|
        data[attribute] = post.send(attribute)
      end
      data[:author] = Presenter::Author.parse(post.author)
      data[:tags] = get_tags(post)
      data
    end

    def self.get_tags(post)
      post.tags.map do |tag|
        Presenter::Tag.parse(tag)
      end
    end
  end
end
