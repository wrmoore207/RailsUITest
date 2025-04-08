class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
