require 'rails_helper'

RSpec.describe "plant_species/new", type: :view do
  before(:each) do
    assign(:plant_specy, PlantSpecy.new(
      name: "MyString"
    ))
  end

  it "renders new plant_specy form" do
    render

    assert_select "form[action=?][method=?]", plant_species_path, "post" do

      assert_select "input[name=?]", "plant_specy[name]"
    end
  end
end
