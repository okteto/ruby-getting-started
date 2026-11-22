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

  def test_info
    get '/api/info'

    assert_equal 200, last_response.status
    info = JSON.parse(last_response.body)
    assert_equal app.settings.message, info['message']
    assert info['runtime'].start_with?('Ruby '), "runtime = #{info['runtime'].inspect}, want the Ruby version"
  end

  def test_page
    get '/'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'id="message"', "the page doesn't show the message"
  end
end
