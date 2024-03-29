require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/business_contacts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # BusinessContact. As you add validations to BusinessContact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    JSON.parse(build(:business_contact).to_json)
  }

  let(:invalid_attributes) {
    JSON.parse(build(:business_contact, email: 'teste').to_json)
  }

  describe "GET /index" do
    it "renders a successful response" do
      BusinessContact.create! valid_attributes
      get business_contacts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      business_contact = BusinessContact.create! valid_attributes
      get business_contact_url(business_contact)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_business_contact_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      business_contact = BusinessContact.create! valid_attributes
      get edit_business_contact_url(business_contact)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new BusinessContact" do
        expect {
          post business_contacts_url, params: { business_contact: valid_attributes }
        }.to change(BusinessContact, :count).by(1)
      end

      it "redirects to the created business_contact" do
        post business_contacts_url, params: { business_contact: valid_attributes }
        expect(response).to redirect_to(business_contact_url(BusinessContact.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new BusinessContact" do
        expect {
          post business_contacts_url, params: { business_contact: invalid_attributes }
        }.to change(BusinessContact, :count).by(0)
      end

      it "renders a fail response (i.e. to display the 'new' template)" do
        post business_contacts_url, params: { business_contact: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        JSON.parse(build(:business_contact, :provider).to_json)
      }

      it "updates the requested business_contact" do
        business_contact = BusinessContact.create! valid_attributes
        patch business_contact_url(business_contact), params: { business_contact: new_attributes }
        business_contact.reload
        expect(business_contact.name).to eq(new_attributes['name'])
        expect(business_contact.email).to eq(new_attributes['email'])
        expect(business_contact.kind).to eq(new_attributes['kind'])
      end

      it "redirects to the business_contact" do
        business_contact = BusinessContact.create! valid_attributes
        patch business_contact_url(business_contact), params: { business_contact: new_attributes }
        business_contact.reload
        expect(response).to redirect_to(business_contact_url(business_contact))
      end
    end

    context "with invalid parameters" do
      it "renders a fail response (i.e. to display the 'edit' template)" do
        business_contact = BusinessContact.create! valid_attributes
        patch business_contact_url(business_contact), params: { business_contact: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested business_contact" do
      business_contact = BusinessContact.create! valid_attributes
      expect {
        delete business_contact_url(business_contact)
      }.to change(BusinessContact, :count).by(-1)
    end

    it "redirects to the business_contacts list" do
      business_contact = BusinessContact.create! valid_attributes
      delete business_contact_url(business_contact)
      expect(response).to redirect_to(business_contacts_url)
    end
  end
end
