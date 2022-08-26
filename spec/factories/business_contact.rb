FactoryBot.define do
  faker_name = Faker::Name.name
  faker_email = Faker::Internet.safe_email(name: faker_name)

  factory :business_contact do
    name { faker_name }
    email { faker_email }

    trait :client do
      kind { 'client' }
    end

    trait :provider do
      kind { 'provider' }
    end
  end
end