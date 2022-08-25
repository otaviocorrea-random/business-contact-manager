class ProductiveProperty < ApplicationRecord
  belongs_to :business_contact

  enum space_between_rows_unit: { cm: 0, m: 1}
  enum space_between_rows_unit: { cm: 0, m: 1}
end
