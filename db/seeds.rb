require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

Post.find_or_create_by!(
  title: "When Harry Met Sally",
  body: "This is my favorite movie."
)

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

Comment.find_or_create_by!(
  post: posts.last,
  body: "Mine too!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"