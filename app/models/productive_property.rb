class ProductiveProperty < ApplicationRecord
  enum :space_between_rows_unit, [:cm, :m], prefix: true, scopes: false
  enum :space_between_plants_unit, [:cm, :m], prefix: true, scopes: false

  belongs_to :business_contact, validate: true, touch: true
  validates_associated :business_contact
  
  has_and_belongs_to_many :plant_species

  validates :name, presence: true
  validates :area, presence: true, numericality: true
  validates :space_between_rows, presence: true, numericality: true
  validates :space_between_rows_unit, presence: true, inclusion: { in: space_between_rows_units.keys }
  validates :space_between_plants, presence: true, numericality: true
  validates :space_between_plants_unit, presence: true, inclusion: { in: space_between_plants_units.keys }
end
