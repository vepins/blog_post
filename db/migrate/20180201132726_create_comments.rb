class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment_entry
      t.string :author
      t.integer :blog_post_id

      t.timestamps
    end
  end
end
