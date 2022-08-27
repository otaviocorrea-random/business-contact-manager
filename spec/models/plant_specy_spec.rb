require 'rails_helper'

RSpec.describe PlantSpecy, type: :model do
  it 'is valid with valid attributes' do
    plant_specy = described_class.new(name: 'Tomate')
    expect(plant_specy).to be_valid

    plant_specy.name = 'Alface'
    expect(plant_specy).to be_valid
  end

  it 'is invalid with invalid attributes' do
    plant_specy = described_class.new(name: 'Tomate')
    expect(plant_specy).to be_valid

    plant_specy.name = ''
    expect(plant_specy).to_not be_valid

    plant_specy.name = nil
    expect(plant_specy).to_not be_valid
  end

  describe 'productive_properties associations' do
    let!(:business_contact) { create(:business_contact, :provider) }
    let!(:productive_properties) { create_list(:productive_property, 3, business_contact: business_contact) }
    let!(:plant_specy) { create(:plant_specy) }

    it 'not have productive properties' do 
      expect(plant_specy.productive_properties.count).to eq(0) 
    end

    it 'have productive properties' do
      plant_specy.productive_properties << productive_properties
      expect(plant_specy.productive_properties.count).to eq(3)
    end
  end
end
