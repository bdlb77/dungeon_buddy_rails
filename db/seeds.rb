# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Campaign.destroy_all
CampaignCharacter.destroy_all

5.times.each do
  User.create(email: Faker::Internet.email, password: "123456", username: Faker::Internet.username(specifier: 3..5))
end

user = User.create(email: "bob@gmail.com", password: "123456", username: "bob1")

user = User.first
user2 = User.second
user3 = User.third

user.campaigns.create(
  [
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(5..7),
      active: true
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: true
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: false
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: true
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: true
    }
  ]
)

user2.campaigns.create(
  [
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: false
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: true
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..6),
      active: true
    }
  ]
)
user3.campaigns.create(
  [
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..6),
      active: false
    },
    {
      title: Faker::Games::DnD.city,  #=> "Earthfast"
      description: Faker::Games::WorldOfWarcraft.quote,
      maximum_player_count: rand(1..7),
      active: true
    }
  ]
)


campaign1 = Campaign.first

campaign1.campaign_characters.create!(
  [
    {
      user: User.second,
      character_class: Faker::Games::DnD.klass
    },
    {
      user: User.third,
      character_class: Faker::Games::DnD.klass
    },
    {
      user: User.fourth,
      character_class: Faker::Games::DnD.klass
    },
    {
      user: User.fourth,
      character_class: Faker::Games::DnD.klass
    }
  ]
)
