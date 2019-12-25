class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false
      t.references :category, null: false
      t.references :status, null: false
      t.string :name, null: false
      t.integer :value, null: false
      t.string :detail
      t.integer :stock

      t.timestamps
    end
  end
end
