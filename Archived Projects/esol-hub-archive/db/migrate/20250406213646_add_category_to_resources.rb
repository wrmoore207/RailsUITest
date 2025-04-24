class AddCategoryToResources < ActiveRecord::Migration[8.0]
  def change
    add_column :resources, :category, :string
    add_index :resources, :category
  end
end
