class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fantasy_name, null: false, default: ''
      t.string :cnpj, null: false, default: ''
      t.string :email
      t.string :telephone, null: false, default: ''
      t.string :address_street, null: false, default: ''
      t.string :address_number, null: false, default: ''
      t.string :address_complement
      t.string :address_neighborhood, null: false, default: ''
      t.string :address_city, null: false, default: ''
      t.string :address_state, null: false, default: ''
      t.string :address_zipcode, null: false, default: ''
      t.string :company_name, null: false, default: ''
      t.string :website
      t.text :observation

      t.timestamps null: false
    end
  end
end
