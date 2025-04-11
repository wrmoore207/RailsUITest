class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :auth0_id

      t.timestamps
    end
  end
end
