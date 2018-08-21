# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d  %k:%M:%S"
