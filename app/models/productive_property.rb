class ProductiveProperty < ApplicationRecord
  include MathHelper

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

  def number_of_plants
    ((area * 1.0) / (cm_to_m(space_between_rows, space_between_rows_unit) * cm_to_m(space_between_plants, space_between_plants_unit))).round
  end
end
