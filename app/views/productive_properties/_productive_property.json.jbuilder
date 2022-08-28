json.extract! productive_property, :id, :name, :area, :space_between_rows, :space_between_rows_unit, :space_between_plants, :space_between_plants_unit, :created_at, :updated_at, :number_of_plants
json.plant_species_count productive_property.plant_species.count
json.url productive_property_url(productive_property, format: :json)
