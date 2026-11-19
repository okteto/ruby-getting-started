require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'
set :port, 8080
# Sinatra only accepts requests for localhost in development. Accept any host.
set :host_authorization, { permitted_hosts: [] }

get '/' do
  message = 'Hello world!'
  message
end
