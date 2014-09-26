class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :permalink
      t.text :content
      t.text :teaser
      t.integer :author_id

      t.timestamps
    end
  end
end
