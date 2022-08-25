require 'rails_helper'

RSpec.describe "plant_species/edit", type: :view do
  before(:each) do
    @plant_specy = assign(:plant_specy, PlantSpecy.create!(
      name: "MyString"
    ))
  end

  it "renders the edit plant_specy form" do
    render

    assert_select "form[action=?][method=?]", plant_specy_path(@plant_specy), "post" do

      assert_select "input[name=?]", "plant_specy[name]"
    end
  end
end
