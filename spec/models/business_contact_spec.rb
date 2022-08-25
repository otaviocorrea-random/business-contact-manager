require 'rails_helper'

RSpec.describe BusinessContact, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:business_contact)).to be_valid
  end
end
