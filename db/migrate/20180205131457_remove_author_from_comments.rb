class RemoveAuthorFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :author, :string
  end
end
