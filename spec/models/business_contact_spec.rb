require 'rails_helper'

RSpec.describe BusinessContact, type: :model do
  let(:business_contact) { create(:business_contact) }
  
  it 'is valid with valid attributes' do
    expect(business_contact).to be_valid
  end

  it 'only accept valid emails' do
    contact = described_class.new(name: 'Teste', kind: 'client', email: 'invalid_email')
    expect(contact).to_not be_valid

    contact.email = 'invalid_email@'
    expect(contact).to_not be_valid

    contact.email = 'invalid_email@invalid'
    expect(contact).to_not be_valid

    contact.email = '@invalid_email.com'
    expect(contact).to_not be_valid

    contact.email = '@invalid'
    expect(contact).to_not be_valid

    contact.email = 'otavio@mail.com'
    expect(contact).to be_valid
  end

  it 'only accept valid kind' do
    contact = described_class.new(name: 'Teste', kind: 'client', email: 'ok@ok.com')
    expect(contact).to be_valid

    contact.kind = 'provider'
    expect(contact).to be_valid

    expect{ contact.kind = :random }.to raise_error(ArgumentError)

    expect{ contact.kind = '72723287' }.to raise_error(ArgumentError)

    expect{ contact.kind = 7455 }.to raise_error(ArgumentError)
  end

  describe 'productive_properties associations' do
    let!(:provider) { create(:business_contact, :provider) }
    let(:client) { create(:business_contact, :client) }
    let!(:productive_property1) { create(:productive_property, business_contact: provider) }
    let!(:productive_property2) { create(:productive_property, business_contact: provider) }
    let!(:productive_property3) { create(:productive_property, business_contact: provider) }
    let(:productive_property4) { build(:productive_property, business_contact: provider) }

    it 'have 3 productive properties' do
      expect(provider.productive_properties.count).to eq(3)
    end
  
    it 'expects that it is not possible to add more than 3 productive properties' do
      expect(productive_property4).not_to be_valid
    end
  
    it 'it is not possible to create productive properties for a client' do
      expect(create(:productive_property, business_contact: client)).not_to be_valid
    end 
  end
end
