require "rails_helper"

RSpec.describe BusinessContactsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/business_contacts").to route_to("business_contacts#index")
    end

    it "routes to #new" do
      expect(get: "/business_contacts/new").to route_to("business_contacts#new")
    end

    it "routes to #show" do
      expect(get: "/business_contacts/1").to route_to("business_contacts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/business_contacts/1/edit").to route_to("business_contacts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/business_contacts").to route_to("business_contacts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/business_contacts/1").to route_to("business_contacts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/business_contacts/1").to route_to("business_contacts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/business_contacts/1").to route_to("business_contacts#destroy", id: "1")
    end
  end
end
