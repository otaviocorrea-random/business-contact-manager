class PlantSpecy < ApplicationRecord
  has_and_belongs_to_many :productive_properties
end
