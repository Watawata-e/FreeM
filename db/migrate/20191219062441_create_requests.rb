class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, null:false
      t.references :item, null:false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
