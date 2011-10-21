require 'rails'

module Spine
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine controller"

      def create_controller
        template "controller.coffee.erb", "app/assets/javascripts/controllers/#{file_name}.js.coffee"
      end
    end
  end
end
