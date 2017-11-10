require 'sinatra'
require 'sinatra/reloader' if development?
require "nokogiri"
require "pry"
require "to_xml"

require_relative "./models/devices.rb"
# require_relative "./data/mini-schema.xml"
require_relative "./controllers/devices_controller.rb"


use Rack::Reloader

use Rack::MethodOverride

run DevicesController