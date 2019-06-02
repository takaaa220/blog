FactoryBot.define do
  factory :post do
    title {"初めてのBlog"}
    content {"いい感じ！"}
    description { "良い" }
    user
  end
end
