require 'rails_helper'

RSpec.describe "productive_properties/show", type: :view do
  before(:each) do
    @productive_property = assign(:productive_property, ProductiveProperty.create!(
      name: "Name",
      area: 2,
      space_between_rows: 3,
      space_between_rows_unit: 4,
      space_between_plants: 5,
      space_between_plants_unit: 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
