ENV['APP_ENV'] = 'test'

require 'simplecov'
SimpleCov.start { skip '/test/' }

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_world
    get '/'

    assert_equal 200, last_response.status
    assert_equal 'Hello world!', last_response.body
  end
end
