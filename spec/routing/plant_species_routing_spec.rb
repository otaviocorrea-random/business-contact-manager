require "rails_helper"

RSpec.describe PlantSpeciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/plant_species").to route_to("plant_species#index")
    end

    it "routes to #new" do
      expect(get: "/plant_species/new").to route_to("plant_species#new")
    end

    it "routes to #show" do
      expect(get: "/plant_species/1").to route_to("plant_species#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plant_species/1/edit").to route_to("plant_species#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/plant_species").to route_to("plant_species#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plant_species/1").to route_to("plant_species#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plant_species/1").to route_to("plant_species#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plant_species/1").to route_to("plant_species#destroy", id: "1")
    end
  end
end
