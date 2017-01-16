$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

def assert_nothing_raised(*)
	yield
end
require 'minitest/autorun'
