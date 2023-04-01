# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Create users
10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

# Create stories
20.times do
  Story.create!(
    title: Faker::Book.title,
    summary: Faker::Lorem.paragraph,
    user_id: rand(1..30),
    rating: rand(1..5),
    status: rand(0..2)
  )
end

stories = Story.all

# Create chapters
stories.each do |story|
  rand(5..10).times do
    Chapter.create!(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraphs(number: 10).join("\n\n"),
      story: story
    )
  end
end

# Create comments
stories.each do |story|
  rand(10..20).times do
    Comment.create!(
      content: Faker::Lorem.paragraph,
      user_id: rand(1..30),
      story: story
    )
  end
end

# Create tags
tags = ["Romance", "Tragedy", "Humor", "Action/Adventure", "Drama", "Mystery", "Horror", "Sci-Fi/Fantasy"]
tags.each do |tag_name|
  Tag.create!(name: tag_name)
end

# Assign tags to stories
stories.each do |story|
  rand(1..3).times do
    tag = Tag.all.sample
    story.tags << tag unless story.tags.include?(tag)
  end
end

# Create a new story and assign some tags to it
story = Story.create(title: "My First Story", summary: "Lorem ipsum dolor sit amet...")
story.tags = [Tag.create(name: "romance"), Tag.create(name: "drama"), Tag.create(name: "tragedy")]

# Retrieve all stories with a given tag
romance_stories = Tag.find_by(name: "romance").stories
