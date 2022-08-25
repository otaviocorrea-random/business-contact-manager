require 'rails_helper'

RSpec.describe "productive_properties/new", type: :view do
  before(:each) do
    assign(:productive_property, ProductiveProperty.new(
      name: "MyString",
      area: 1,
      space_between_rows: 1,
      space_between_rows_unit: 1,
      space_between_plants: 1,
      space_between_plants_unit: 1
    ))
  end

  it "renders new productive_property form" do
    render

    assert_select "form[action=?][method=?]", productive_properties_path, "post" do

      assert_select "input[name=?]", "productive_property[name]"

      assert_select "input[name=?]", "productive_property[area]"

      assert_select "input[name=?]", "productive_property[space_between_rows]"

      assert_select "input[name=?]", "productive_property[space_between_rows_unit]"

      assert_select "input[name=?]", "productive_property[space_between_plants]"

      assert_select "input[name=?]", "productive_property[space_between_plants_unit]"
    end
  end
end
