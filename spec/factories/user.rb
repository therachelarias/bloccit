FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) {|n| "person#{n}@example.com"}
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      transient do
        comments_count 1
        posts_count 1
      end
      after(:build) do |user, evaluator|
        evaluator.comments_count.times do
          create(:comment, user: user)  
        end
        evaluator.posts_count.times do
          create(:post, user: user)
        end
      end
    end
  end
end