# Building our policy with TDD
To test we are going to use a combination of shoulda matchers and pundit matchers.

```ruby
gem 'shoulda-matchers', '~> 3.1'
gem 'pundit-matchers', '~> 1.0.2'
```
`bundle install`

 We won't need to define a matcher called `permit` since it's included for us with pundit-matchers. e.g., `permit(:show)`, `permit(:create)`. This is just for example.

```ruby
#./spec/support/pundit_matcher.rb
RSpec::Matchers.define :permit do |action|
  match do |policy|
    # "#{action}?" e.g., index? show? update?
    policy.public_send("#{action}?")
  end

  failure_message_for_should do |policy|
    "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
  end

  failure_message_for_should_not do |policy|
    "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end
```

With our new matcher we still need a beauty_place factory.  You can use any fixture for this and I am not going to get into it with this blog post but check factory_girl_rails github for how to set it up.
`FactoryGirl.create(:model)` is shortened to `create(:model)`

lets write our first test `./spec/policies/beauty_place_policy_spec.rb`

```ruby
require 'rails_helper'

describe DealPolicy do
  subject { DealPolicy.new(user, deal) }

  let(:resolved_scope) {
      DealPolicy::Scope.new(user, Deal.all).resolve
    }

  context 'being a site visitor' do
    let(:user) { nil }
    let(:beauty_place) { create(:salon) }

    context 'creating a new beauty_place' do
      it { should forbid_new_and_create_actions }
      it { should forbid_mass_assignment_of(:deal) }
    end

    context 'accessing an existing beauty_place' do
      it { should permit_action(:show) }
      it { should forbid_edit_and_update_actions }
      it { should forbid_action(:destroy) }
      it { shuold forbid_mass_assignment_of(:deal)}
    end

  end

  context 'being a site administrator' do
    let(:user) { create(:user, :admin) }
    let(:beauty_place) { create(:salon) }

    context 'permits new and create actions' do
      it { should permit_new_and_create_actions }
      it { should permit_mass_assignment_of(:deal) }
    end

    context 'accessing an existing deal' do
      it { should permit_action(:show) }
      it { should permit_edit_and_update_actions }
      it { should permit_action(:destroy) }
      # it { should permit_mass_assignment_of(:deal) }
    end
  end
end
```

Bon Chance! We have written a policy and some tests.  Hopefully this enough to get you through writting permissions with Pundit.
# Resources
[pundit-matchers](https://github.com/chrisalley/pundit-matchers)
