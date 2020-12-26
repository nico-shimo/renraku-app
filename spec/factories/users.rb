FactoryBot.define do
  factory :user do
    name                  {"test"}
    child_name            {"miko"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
  end
end