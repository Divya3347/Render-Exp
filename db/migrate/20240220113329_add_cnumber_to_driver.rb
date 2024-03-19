class AddCnumberToDriver < ActiveRecord::Migration[7.1]
  def change
    add_column :drivers, :cnum, :string
  end
end
