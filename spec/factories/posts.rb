FactoryBot.define do
  factory :post do
    title {"初めてのBlog"}
    content {"いい感じ！"}
    after(:create) do |post|
      post.user = create(:user, { status: "admin" })
    end
  end
end
