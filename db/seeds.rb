2000.times do |i|
  PropertyMarker.create(
    min_price: rand(100000...10000000),
    latitude: rand(55.55...55.92).round(6),
    longitude: rand(37.3...37.9).round(6),
    marker_type: ['rent', 'sale'].sample
  )
end

100.times do |i|
  DevelopmentMarker.create(
    min_price: rand(100000...10000000),
    latitude: rand(55.55...55.92).round(6),
    longitude: rand(37.3...37.9).round(6),
    name: "Apartment #{i}",
    photo_url: '/assets/apartment.jpg'
  )
end