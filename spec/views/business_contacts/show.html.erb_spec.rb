require 'rails_helper'

RSpec.describe "business_contacts/show", type: :view do
  before(:each) do
    @business_contact = assign(:business_contact, BusinessContact.create!(
      name: "Name",
      type: 2,
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
  end
end
