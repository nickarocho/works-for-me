# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

u = User.create({name: 'Joe Shmoe', email: 'joe@shmoe.com', password_digest: 'abc123'})
u.events.create({title: "Joe's Dinner Party", location: '1234 Test St.', duration: 120, chosen_slot: 2})

u = User.create({name: 'Batman', email: 'bat@man.com', password_digest: '123abc'})
u.events.create({title: "Gotham Hang", location: "Batman's House", duration: 300, chosen_slot: 5})