RSpec::Matchers.define :serve do |asset_name|
  match do |sprockets|
    !!sprockets[asset_name]
  end

  failure_message_for_should do |sprockets|
    "expected #{asset_name} to be served, but it wasn't"
  end

  failure_message_for_should_not do |sprockets|
    "expected #{asset_name} NOT to be served, but it was"
  end

  description do
    "serve #{asset_name}"
  end
end
