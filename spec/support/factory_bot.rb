RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include ActionDispatch::TestProcess
end
