require 'rails_helper'

RSpec.describe ProductiveProperty, type: :model do
  it 'is valid with valid attributes' do
    productive_property = described_class.new(
      name: 'Teste',
      space_between_rows: 1,
      space_between_rows_unit: :cm,
      space_between_plants: 1,
      space_between_plants_unit: :cm,
      business_contact: create(:business_contact, :provider)
    )
    expect(productive_property).to be_valid
  end

  it 'not create without business_contact' do
    productive_property = described_class.new(
      name: 'Teste',
      space_between_rows: 1,
      space_between_rows_unit: :cm,
      space_between_plants: 1,
      space_between_plants_unit: :cm
    )
    expect(productive_property).to_not be_valid
  end

  describe 'business_contact associations' do
    let!(:provider) { create(:business_contact, :provider) }
    let!(:client) { create(:business_contact, :client) }

    it 'cannot create a productive property for a client' do
      expect(create(:productive_property, business_contact: client)).to_not be_valid
    end

    it 'cannot add more than 3 properties for a provider' do
      create_list(:productive_property, 3, business_contact: provider)
      expect(create(:productive_property, business_contact: provider)).to_not be_valid
    end
  end

  describe 'plant_specy associations' do
    let!(:business_contact) { create(:business_contact, :provider) }
    let!(:productive_property) { create(:productive_property, business_contact: business_contact) }
    let!(:plant_species) { create_list(:plant_specy, 2) }

    it 'not have plants' do 
      expect(productive_property.plant_species.count).to eq(0) 
    end

    it 'have plants' do
      productive_property.plant_species << plant_species
      expect(productive_property.plant_species.count).to eq(2)
    end
  end
end
