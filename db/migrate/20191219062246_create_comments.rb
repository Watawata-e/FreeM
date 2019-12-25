class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, null:false
      t.references :item
      t.references :administrator
      t.string :sentence, null: false

      t.timestamps
    end
  end
end
