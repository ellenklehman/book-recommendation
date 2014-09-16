# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email('example@example.com')
    password('password')
    password_confirmation('password')
  end

  factory :book do
    title('Little Women')
    author('Louisa May Alcott')
    genre('Historical Fiction')
    description('A story of 4 sisters who deal with love, loss and family during the post civil war era.')
  end

  factory :list do
    name('Historical YA')
  end
end
