class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :make_id, index: true
      t.string :name
      t.integer :webmotors_id, index: true

      t.timestamps null: false
    end
  end
end
