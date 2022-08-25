class ProductiveProperty < ApplicationRecord
  enum :space_between_rows_unit => [:cm, :m]
  enum :space_between_rows_unit => [:cm, :m]

  belongs_to :business_contact
  has_and_belongs_to_many :plant_species
end
