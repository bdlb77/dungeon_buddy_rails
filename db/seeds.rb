# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: "bob@gmail.com", password: "123456", username: "bob1")
user2 = User.create(email: "sally@gmail.com", password: "123456", username: "salstorm")

campaign = Campaign.create(title: "First DnD Campaign", description: "A wonderful campaign", maximum_player_count: 5,
                           active: true, user: user2)

campaign_session = CampaignCharacter.create(campaign:,  user:)
