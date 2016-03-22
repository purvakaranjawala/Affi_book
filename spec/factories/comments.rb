FactoryGirl.define do
  factory :comment do
    user_id 1
    post_id 1
    comment_post "MyString"
  end
end
