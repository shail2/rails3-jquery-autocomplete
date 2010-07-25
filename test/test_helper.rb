require 'test/unit'

require 'rubygems'
gem 'rails', '>=3.0.0.beta4'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "active_support"
require "active_record"
require "active_model"
require "action_controller"
require "rails/railtie"

require "#{File.dirname(__FILE__)}/../init"

class ApplicationController < ActionController::Base; end

ActionController::Base.view_paths = File.join(File.dirname(__FILE__), 'views')

Autocomplete::Routes = ActionDispatch::Routing::RouteSet.new
Autocomplete::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action'
end

ActionController::Base.send :include, Autocomplete::Routes.url_helpers

class ActiveSupport::TestCase
  setup do
    @routes = Autocomplete::Routes
  end
end