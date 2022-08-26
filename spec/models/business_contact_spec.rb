require 'rails_helper'

RSpec.describe BusinessContact, type: :model do
  let!(:business_contact) { create(:business_contact, :provider) }
  let!(:plant_specy) { create(:plant_specy) }
  let!(:productive_property1) { create(:productive_property, business_contact: business_contact, plant_species: [plant_specy]) }
  let!(:productive_property2) { create(:productive_property, business_contact: business_contact) }
  let!(:productive_property3) { create(:productive_property, business_contact: business_contact) }
  let(:productive_property4) { create(:productive_property, business_contact: business_contact) }
  
  it 'is valid with valid attributes' do
    expect(business_contact).to be_valid
  end

  it 'have only 3 productive properties' do
    expect(business_contact.productive_properties.count).to eq(3)
  end

  it 'expects that it is not possible to add more than 3 productive properties' do
    expect(productive_property4).not_to be_valid
  end

  it 'it is not possible to create productive properties for a customer' do
    client = create(:business_contact, :client)
    expect(create(:productive_property, business_contact: client)).not_to be_valid
  end 
end
