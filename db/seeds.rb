# puts Faker::Book.title

# p Faker::Lorem.paragraphs.join("\r\n")

1.times do
  @post = Post.create(post_title: Faker::Book.title, post_body: Faker::Lorem.paragraphs.join("\r\n"))
  @tag = Tag.create(tag: "Random")

  @post.tags << @tag
end