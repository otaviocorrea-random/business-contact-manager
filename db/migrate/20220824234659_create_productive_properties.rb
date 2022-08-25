class CreateProductiveProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :productive_properties do |t|
      t.references :business_contacts, null: false
      t.string :name, null: false
      t.integer :area, null: false
      t.integer :space_between_rows, null: false
      t.integer :space_between_rows_unit, default: 0
      t.integer :space_between_plants, null: false
      t.integer :space_between_plants_unit, default: 0

      t.timestamps
    end
  end
end
