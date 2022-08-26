class CreatePlantSpeciesProductivePropertiesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_species_productive_properties do |t|
      t.references :plant_specy, null: false, index: { name: :plant_specy_on_productive_property_relation }
      t.references :productive_property, null: false, index: { name: :productive_property_on_plant_specy_relation }
      t.timestamps
    end

    add_index(:plant_species_productive_properties, [:plant_specy_id, :productive_property_id], unique: true, name: :plant_species_productive_properties_unique_key)
  end
end
