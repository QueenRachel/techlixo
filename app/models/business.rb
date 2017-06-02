class Business < ActiveRecord::Base
  belongs_to :user

  validates :fantasy_name, :cnpj, :email, :telephone, :address_street, :address_number,
            :address_neighborhood, :address_city, :address_state, :address_zipcode,
            :company_name, presence: true

  validates :cnpj, length: { is: 14 }
end
