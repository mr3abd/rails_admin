# coding: utf-8
# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    sequence(:name) { |n| "Player #{n}" }
    sequence(:number) { |n| n }
    sequence(:position) { |n| "Position #{n}" }
  end

  factory :draft do
    date { 1.week.ago }
    sequence(:round)
    sequence(:pick)
    sequence(:overall)
    sequence(:college) { |n| "College #{n}" }
    association :team
    association :player
  end

  factory :team do
    sequence(:division_id)
    sequence(:name) { |n| "Team #{n}" }
    sequence(:manager) { |n| "Manager #{n}" }
    sequence(:founded)
    sequence(:wins)
    sequence(:losses)
    sequence(:win_percentage)

    factory :managed_team, class: ManagedTeam
    factory :restricted_team, class: RestrictedTeam
  end

  factory :league do
    sequence(:name) { |n| "League #{n}" }
  end

  factory :division do
    sequence(:custom_league_id)
    sequence(:name) { |n| "Division #{n}" }
  end

  factory :fan do
    sequence(:name) { |n| "Fan #{n}" }
  end

  factory :fanship do
    association :fan
    association :team
  end

  factory :favorite_player do
    association :fanship
    association :player
  end

  factory :user do
    sequence(:email) { |n| "username_#{n}@example.com" }
    sequence(:password) { |_n| 'password' }

    factory :user_confirmed, class: User::Confirmed
    factory :managing_user, class: ManagingUser
  end

  factory :field_test do
  end

  factory :comment do
    sequence(:content) do |n|
      <<-LOREM_IPSUM
        Lorém --#{n}-- ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      LOREM_IPSUM
    end

    factory :comment_confirmed, class: Comment::Confirmed do
      content { 'something' }
    end
  end

  factory :ball do
    color { %w[red blue green yellow purple brown black white].sample }
  end

  factory :hardball do
    color { 'blue' }
  end

  factory :image do
    file { File.open(Rails.root.join('public', 'robots.txt')) }
  end

  factory :paper_trail_test do
    sequence(:name) { |n| "name #{n}" }

    factory :paper_trail_test_subclass,
            parent: :paper_trail_test,
            class: 'PaperTrailTestSubclass'

    factory :paper_trail_test_subclass_in_namespace,
            parent: :paper_trail_test,
            class: 'PaperTrailTest::SubclassInNamespace'

    factory :paper_trail_test_with_custom_association,
            parent: :paper_trail_test,
            class: 'PaperTrailTestWithCustomAssociation'
  end

  factory :two_level_namespaced_polymorphic_association_test, class: 'TwoLevel::Namespaced::PolymorphicAssociationTest' do
    sequence(:name) { |n| "name #{n}" }
  end
end
