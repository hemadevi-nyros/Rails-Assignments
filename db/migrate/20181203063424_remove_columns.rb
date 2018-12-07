class RemoveColumns < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :articles, :category
    remove_column :posts,    :description
  end
end
