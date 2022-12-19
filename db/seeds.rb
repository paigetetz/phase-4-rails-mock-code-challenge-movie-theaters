puts "Seeding theaters..."
Theater.create!([
  {
    name: "Royal Cinema",
    capacity: 60
  },
  {
    name: "Amazing World Cinemas",
    capacity: 120
  },
  {
    name: "Lounge Chair Theater",
    capacity: 20
  }
])

puts "Seeding guests..."
Guest.create!([
  {
    name: "Chett"
  },
  {
    name: "Alina"
  },
  {
    name: "Mohammad"
  },
  {
    name: "Ricardo"
  },
  {
    name: "Michael"
  },
  {
    name: "Charlie"
  }
])

puts "Buying tickets for guests..."
Theater.all.each do |theater|
  rand(2..6).times do
    # get a random guest
    guest = Guest.all.sample

    Ticket.create!(theater_id: theater.id, guest_id: guest.id, price: rand(10..25))
  end
end

puts "Done seeding! Enjoy your movie!"
