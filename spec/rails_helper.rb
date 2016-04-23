ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'shoulda/matchers'
require 'database_cleaner'
require 'pundit/rspec'
# require 'paperclip/matchers'

# require files inside of support
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  # config.filter_rails_from_backtrace!
  config.include FactoryGirl::Syntax::Methods
  config.include Features::SessionHelpers, type: :feature
  # config.include Devise::TestHelpers, type: :controller
  # config.include Devise::TestHelpers, type: :view
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller

    with.library :rails
  end
end
