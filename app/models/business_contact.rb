class BusinessContact < ApplicationRecord
  enum :kind, [:client, :provider], scopes: false, default: :client
  
  has_many :productive_properties, dependent: :destroy

  validate :max_productive_properties_validation

  private
  def max_productive_properties
    provider? ? 3 : 0
  end

  def max_productive_properties_validation
    if productive_properties.reload.size > max_productive_properties
      errors.add(:productive_properties, "can't be more than #{max_productive_properties} for #{kind}")
    end
  end
end
