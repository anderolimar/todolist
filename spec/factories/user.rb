FactoryBot.define do
  factory :user do
    email { 'emai@test.com' }
    password { 'password'} 
    password_confirmation { 'password' }
  end
end