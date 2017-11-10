class DevicesController < Sinatra::Base
   # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/' do
    Device.all
  end



  get '/:name' do

    @name = params[:name]

    @devices = Device.find(@name)
  
  end
  
  
end