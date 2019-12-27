class CreateApparts < ActiveRecord::Migration[6.0]
  def change
    create_table :apparts do |t|
      t.string :ville
      t.integer :price
      t.integer :surface
      t.integer :pieces
      t.text :description

      t.timestamps
    end
  end
end
