class CreateBoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :boughts do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.integer :number, null: false
      t.integer :review

      t.timestamps
    end
  end
end
