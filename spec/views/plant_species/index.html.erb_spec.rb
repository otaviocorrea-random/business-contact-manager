require 'rails_helper'

RSpec.describe "plant_species/index", type: :view do
  before(:each) do
    assign(:plant_species, [
      PlantSpecy.create!(
        name: "Name"
      ),
      PlantSpecy.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of plant_species" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
