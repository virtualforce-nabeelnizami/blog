# Load the rails application
require File.expand_path('../application', __FILE__)


::ActiveSupport::Deprecation.silenced = true
# Initialize the rails application
Blog::Application.initialize!
#config.gem(
#  'thinking-sphinx', :version => '1.4.10'
#)