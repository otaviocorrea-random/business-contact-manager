FactoryBot.define do
  faker_name = Faker::Name.unique.name
  faker_email = Faker::Internet.unique.safe_email(name: faker_name)

  factory :business_contact do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.safe_email(name: name) }

    trait :client do
      kind { 'client' }
    end

    trait :provider do
      kind { 'provider' }
    end
  end
end