class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :recipient
      t.string :subject
      t.text :body
      t.boolean :read

      t.timestamps
    end
  end
end
