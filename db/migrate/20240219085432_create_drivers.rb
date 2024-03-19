class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :marry
      t.string :car
      t.string :color

      t.timestamps
    end
  end
end
