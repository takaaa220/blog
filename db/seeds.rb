user = User.create(
  email: "admin@admin.com",
  password: "pass0000",
  status: 1
)


30.times do |i|
  Post.create(
    user_id: user.id,
    title: "title#{i}",
    description: "description:#{i}",
    content: "#{i} contentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
  )
end