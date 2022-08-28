FactoryBot.define do
  factory :business_contact do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.safe_email(name: name.parameterize) }
  
    trait :client do
      kind { 'client' }
    end

    trait :provider do
      kind { 'provider' }
    end
  end
end