require 'rails_helper'

RSpec.describe "productive_properties/index", type: :view do
  before(:each) do
    assign(:productive_properties, [
      ProductiveProperty.create!(
        name: "Name",
        area: 2,
        space_between_rows: 3,
        space_between_rows_unit: 4,
        space_between_plants: 5,
        space_between_plants_unit: 6
      ),
      ProductiveProperty.create!(
        name: "Name",
        area: 2,
        space_between_rows: 3,
        space_between_rows_unit: 4,
        space_between_plants: 5,
        space_between_plants_unit: 6
      )
    ])
  end

  it "renders a list of productive_properties" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
  end
end
