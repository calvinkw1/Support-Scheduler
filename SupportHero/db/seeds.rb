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
  name: 'Eaden'
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


Shift.create(
  user_id: 1,
  date: "2015/06/10",
  avail: true,
  weekend: false,
  holiday: false
  )
Shift.create(
  user_id: 2,
  date: "2015/06/11",
  avail: true,
  weekend: true,
  holiday: false
  )
Shift.create(
  user_id: 3,
  date: "2015/06/12",
  avail: true,
  weekend: false,
  holiday: true
  )
