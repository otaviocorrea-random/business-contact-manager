FactoryBot.define do
  factory :productive_property do
    name { Faker::Address.full_address }
    area { Faker::Number.between(from: 100, to: 1000) }
    space_between_rows { Faker::Number.between(from: 1, to: 10) }
    space_between_rows_unit { :cm }
    space_between_plants { Faker::Number.between(from: 1, to: 10) }
    space_between_plants_unit { :cm }
  end
end