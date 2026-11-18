require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'
set :host_authorization, { permitted_hosts: [] }

get '/' do
  message = 'Hello world!'
  message
end