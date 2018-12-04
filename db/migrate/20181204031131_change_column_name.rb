class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :articles, :checkbox, :is_published
  end
end
