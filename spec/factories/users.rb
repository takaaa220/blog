FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "takaaa#{n}@aaa.aaa" }
    status { 0 }
    password { "hirata1111" }
  end
end
