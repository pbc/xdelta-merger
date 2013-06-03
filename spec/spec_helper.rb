require "rubygems"
require "bundler/setup"

require "xdelta_merger"

require "webmock/rspec"

require "fixtures"

Dir[File.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

end
