require 'rails_helper'

RSpec.describe "business_contacts/index", type: :view do
  before(:each) do
    assign(:business_contacts, [
      BusinessContact.create!(
        name: "Name",
        type: 2,
        email: "Email"
      ),
      BusinessContact.create!(
        name: "Name",
        type: 2,
        email: "Email"
      )
    ])
  end

  it "renders a list of business_contacts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
