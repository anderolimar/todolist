FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Title#{n}" }
    sequence(:description) { |n| "Description#{n}" }

    factory :task_todo do
      done  { false }
    end

    factory :task_done do
      done  { true }
    end
  end
end
