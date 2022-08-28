class ProductiveProperty < ApplicationRecord
  include MathHelper

  enum :space_between_rows_unit, [:cm, :m], prefix: true, scopes: false
  enum :space_between_plants_unit, [:cm, :m], prefix: true, scopes: false

  belongs_to :business_contact, validate: true, touch: true
  validates_associated :business_contact, after: :save
  validate :max_productive_properties_validation, on: [:create]
  
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

  private
  #This method exists in duplicate in both models because 
  #when creating a new productive property it considers the 
  #previous amount allowing to create one more than the limit.
  def max_productive_properties_validation
    return nil if !business_contact || !business_contact.provider?
    max = business_contact.max_productive_properties
    if (business_contact.productive_properties.size + 1) > max
      errors.add(:productive_properties, "can't be more than #{max} for #{business_contact.kind}")
    end
  end
end
