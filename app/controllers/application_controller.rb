require 'rack-flash'
require_relative '../models/concerns/slug.rb'
class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }



  get '/' do
    erb :index
  end
end
