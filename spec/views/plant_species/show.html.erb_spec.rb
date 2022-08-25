require 'rails_helper'

RSpec.describe "plant_species/show", type: :view do
  before(:each) do
    @plant_specy = assign(:plant_specy, PlantSpecy.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
