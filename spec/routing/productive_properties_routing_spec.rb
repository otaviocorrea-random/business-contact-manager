require "rails_helper"

RSpec.describe ProductivePropertiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/productive_properties").to route_to("productive_properties#index")
    end

    it "routes to #new" do
      expect(get: "/productive_properties/new").to route_to("productive_properties#new")
    end

    it "routes to #show" do
      expect(get: "/productive_properties/1").to route_to("productive_properties#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/productive_properties/1/edit").to route_to("productive_properties#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/productive_properties").to route_to("productive_properties#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/productive_properties/1").to route_to("productive_properties#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/productive_properties/1").to route_to("productive_properties#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/productive_properties/1").to route_to("productive_properties#destroy", id: "1")
    end
  end
end
