Dir[Rails.root.join("spec", "factories", "**", "*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
