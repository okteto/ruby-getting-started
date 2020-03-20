require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'

get '/' do
  "Hello world!"
end