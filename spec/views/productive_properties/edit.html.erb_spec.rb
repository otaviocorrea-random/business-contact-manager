require 'rails_helper'

RSpec.describe "productive_properties/edit", type: :view do
  before(:each) do
    @productive_property = assign(:productive_property, ProductiveProperty.create!(
      name: "MyString",
      area: 1,
      space_between_rows: 1,
      space_between_rows_unit: 1,
      space_between_plants: 1,
      space_between_plants_unit: 1
    ))
  end

  it "renders the edit productive_property form" do
    render

    assert_select "form[action=?][method=?]", productive_property_path(@productive_property), "post" do

      assert_select "input[name=?]", "productive_property[name]"

      assert_select "input[name=?]", "productive_property[area]"

      assert_select "input[name=?]", "productive_property[space_between_rows]"

      assert_select "input[name=?]", "productive_property[space_between_rows_unit]"

      assert_select "input[name=?]", "productive_property[space_between_plants]"

      assert_select "input[name=?]", "productive_property[space_between_plants_unit]"
    end
  end
end
