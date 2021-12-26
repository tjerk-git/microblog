# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

posts = Post.create({title: Faker::Hobby.activity, body: Faker::Lorem.paragraph})

newsletter = Newsletter.create({title: "first newsletter", body:"something"})

if newsletter
    Movie.create([
        { 
        title: Faker::Movie.title,
        newsletter_id: newsletter.id,
        link: Faker::Internet.url
        }])
    Book.create([
        {
        title: Faker::Book.title,
        author: Faker::Book.author,
        newsletter_id: newsletter.id,
        link: Faker::Internet.url
    }])
    Album.create(
        [{
        title: Faker::Music.album,
        artist: Faker::Music.band,
        newsletter_id: newsletter.id,
        link: Faker::Internet.url
    }])
    Game.create([
        {
        title: Faker::Game.title,
        newsletter_id: newsletter.id,
        link: Faker::Internet.url
    }])
end