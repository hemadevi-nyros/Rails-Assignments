class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.string :upload
      t.boolean :checkbox

      t.timestamps
    end
  end
end
