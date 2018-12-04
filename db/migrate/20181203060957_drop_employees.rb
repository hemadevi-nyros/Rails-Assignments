class DropEmployees < ActiveRecord::Migration[5.2]
  def change
  	drop_table :employees
  end
end
