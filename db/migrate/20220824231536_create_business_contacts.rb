class CreateBusinessContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :business_contacts do |t|
      t.string :name, null: false
      t.integer :kind, null: false, default: 0
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
