json.extract! business_contact, :id, :name, :kind, :email, :created_at, :updated_at
json.url business_contact_url(business_contact, format: :json)
