FactoryBot.define do
  factory :user do

    name {"tomoaki"}
    email {"tomoaki@tomoaki.com"}
    encrypted_password {"tomoaki1169"}

    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"password0"}
    password_confirmation {"password0"}

  end
end
