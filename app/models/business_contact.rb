class BusinessContact < ApplicationRecord
  include RegexHelper

  enum :kind, [:client, :provider], default: :client
  
  has_many :productive_properties, dependent: :destroy
  validate :max_productive_properties_validation

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }
  validates :kind, presence: true, inclusion: { in: kinds.keys }

  scope :filter_by_name_or_email, -> (search) { where("name LIKE :search OR email LIKE :search", search: "%#{search}%") }

  def formated_kind_name 
    I18n.t("words.#{kind}")
  end

  def max_productive_properties
    provider? ? 3 : 0
  end

  private
  def max_productive_properties_validation
    if productive_properties.reload.size > max_productive_properties
      errors.add(:productive_properties, "can't be more than #{max_productive_properties} for #{kind}")
    end
  end
end
