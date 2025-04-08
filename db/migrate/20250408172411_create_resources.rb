class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.datetime :posted_at
      t.string :category
      t.text :description
      t.boolean :fulfilled

      t.timestamps
    end
  end
end
