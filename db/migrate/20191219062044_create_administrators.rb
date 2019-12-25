class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.string :loginID, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
