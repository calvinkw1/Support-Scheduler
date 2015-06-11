# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  name: 'Sherry'
  )
User.create(
  name: 'Boris'
  )
User.create(
  name: 'Vicente'
  )
User.create(
  name: 'Matte'
  )
User.create(
  name: 'Jack'
  )
User.create(
  name: 'Kevin'
  )
User.create(
  name: 'Zoe'
  )
User.create(
  name: 'Jay'
  )
User.create(
  name: 'Eadon'
  )
User.create(
  name: 'Franky'
  )
User.create(
  name: 'Luis'
  )
User.create(
  name: 'James'
  )

starting_order = ["Sherry", "Boris", "Vicente", "Matte", "Jack", 
    "Sherry", "Matte", "Kevin", "Kevin", "Vicente", "Zoe", "Kevin",
     "Matte", "Zoe", "Jay", "Boris", "Eadon", "Sherry", "Franky", 
     "Sherry", "Matte", "Franky", "Franky", "Kevin", "Boris", "Franky",
      "Vicente", "Luis", "Eadon", "Boris", "Kevin", "Matte", "Jay", 
      "James", "Kevin", "Sherry", "Sherry", "Jack", "Sherry", "Jack"]

counter = 0
starting_order.each do |user|
  user = User.find_by name: user
  date = Date.today + counter
  Shift.create(
    user_id: user.id,
    date: date,
    avail: true,
    weekend: date.saturday? || date.sunday?,
    holiday: date.holiday?
    )
  counter += 1
end