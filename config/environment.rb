require "sinatra/reloader" if development?

require "sass/plugin/rack"
Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack

register Sinatra::AssetPack
assets do
  js :app, [
    '/js/app.js'
  ]
  css :app, [
    '/styles/app.css'
  ]
  js_compression :jsmin
  css_compression :simple
end

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :views, File.join(APP_ROOT, "app", "views")
end

["models", "controllers", "helpers"].each do |folder|
  Dir[APP_ROOT.join("app", folder, "*.rb")].each { |file| require file }
end