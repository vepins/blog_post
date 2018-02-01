class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :blog_entry
      t.string :author

      t.timestamps
    end
  end
end
