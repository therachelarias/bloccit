Post.find_or_create_by(
  title: "When Harry Met Sally",
  body: "This is my favorite movie."
)

Comment.find_or_create_by(
  body: "Mine too!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"