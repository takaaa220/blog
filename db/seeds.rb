user = User.create(
    email: "admin@admin.com",
    password: "pass0000",
    status: 1
)


30.times do |i|
  Post.create(
          title: "title#{i}",
          content: "#{i} contentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
  )
end