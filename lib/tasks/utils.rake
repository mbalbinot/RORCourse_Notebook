namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
  
    puts "Including Contacts..."
    10.times do |i|
        Contact.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            kind: Kind.all.sample,
            rmk: LeroleroGenerator.sentence
        )
    end
    puts "Including Contacts... [OK]"
  
    puts "Including Adresses..."
    Contact.all.each do |contact|
      puts "Including adresses to " + contact.name + "..."
      Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
        )
    end
    puts "Including Adresses... [OK]"
  
    puts "Including Phones..."
    Contact.all.each do |contact|
      puts "Including phone to " + contact.name + "..."
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Including Phones... [OK]"

  end

end
