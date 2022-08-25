class ProductiveProperty < ApplicationRecord
  enum :space_between_rows_unit, [:cm, :m], scopes: false
  enum :space_between_plants_unit, [:cm, :m], scopes: false

  belongs_to :business_contact
  validates_associated :business_contact
  
  has_and_belongs_to_many :plant_species
end
