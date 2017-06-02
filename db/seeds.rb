# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "========> Criando usuários básicos"

10.times do |index|
  User.create!(
    name: "User #{index}",
    email: "user_#{index}@example.com",
    password: "123123123"
  )
end

puts "========> Criando empresas básicas"

100.times do |index|
  b = Business.new(
    fantasy_name: "Empresa #{index}",
    cnpj: "43514896777138",
    email: "business_#{index}@example.com",
    telephone: "51872663947",
    address_street: "Rua da Empresa #{index}",
    address_number: "#{rand(1000..9999)}",
    address_neighborhood: "Bairro #{index}",
    address_city: "Cidade #{index}",
    address_state: "Estado #{index}",
    address_zipcode: "#{rand(95600000..99999999)}",
    company_name: "Empresa #{index} LTDA"
  )
  b.user = User.all.sample
  b.save!
end
