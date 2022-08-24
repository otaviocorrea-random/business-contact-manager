require 'rails_helper'

RSpec.describe "business_contacts/edit", type: :view do
  before(:each) do
    @business_contact = assign(:business_contact, BusinessContact.create!(
      name: "MyString",
      type: 1,
      email: "MyString"
    ))
  end

  it "renders the edit business_contact form" do
    render

    assert_select "form[action=?][method=?]", business_contact_path(@business_contact), "post" do

      assert_select "input[name=?]", "business_contact[name]"

      assert_select "input[name=?]", "business_contact[type]"

      assert_select "input[name=?]", "business_contact[email]"
    end
  end
end
