ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

require 'yaml'


module Psych
  class << self
    alias_method :load_without_aliases, :load

    def load(yaml, **kwargs)
      kwargs[:aliases] = true
      load_without_aliases(yaml, **kwargs)
    end
  end
end

