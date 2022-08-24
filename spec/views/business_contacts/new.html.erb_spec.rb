require 'rails_helper'

RSpec.describe "business_contacts/new", type: :view do
  before(:each) do
    assign(:business_contact, BusinessContact.new(
      name: "MyString",
      type: 1,
      email: "MyString"
    ))
  end

  it "renders new business_contact form" do
    render

    assert_select "form[action=?][method=?]", business_contacts_path, "post" do

      assert_select "input[name=?]", "business_contact[name]"

      assert_select "input[name=?]", "business_contact[type]"

      assert_select "input[name=?]", "business_contact[email]"
    end
  end
end
