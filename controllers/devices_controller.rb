class DevicesController < Sinatra::Base
   # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/' do
    content_type 'text/xml'
    Device.all
  end

  get '/:name' do
    content_type 'text/xml'

    @name = params[:name]

    @devices = Device.find(@name)
  
  end
  
  
end