
puts "Cleaning database..."
Restaurant.destroy_all

puts 'creating 10 restaurants'

10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::CATEGORY.sample,
    phone_number: Faker::PhoneNumber
  )
end
puts "done!"
