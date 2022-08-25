class CreatePlantSpeciesProductivePropertiesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_species_productive_properties do |t|
      t.references :plant_species, null: false, index: { name: :plant_specy_on_productive_property_relation }
      t.references :productive_properties, null: false, index: { name: :productive_property_on_plant_specy_relation }
      t.timestamps
    end

    add_index(:plant_species_productive_properties, [:plant_species_id, :productive_properties_id], unique: true, name: :plant_species_productive_properties_unique_key)
  end
end
