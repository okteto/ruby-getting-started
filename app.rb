require 'json'
require 'socket'
require 'sinatra'
require 'sinatra/reloader'

# The message under the logo. Change it and save the file to see hot reload.
set :message, 'Built, deployed, and tested on Kubernetes.'

set :bind, '0.0.0.0'
set :port, 8080
# Sinatra only accepts requests for localhost in development. Accept any host.
set :host_authorization, { permitted_hosts: [] }
# The page asks for its info every second. Don't log every request.
set :logging, false
set :server_settings, { AccessLog: [] }

# The page with the Okteto logo.
get '/' do
  send_file File.join(__dir__, 'static', 'index.html')
end

# The message, the Ruby version, and the pod that answers.
get '/api/info' do
  pod = Socket.gethostname
  content_type :json
  { message: settings.message, runtime: "Ruby #{RUBY_VERSION}", pod: pod }.to_json
end
