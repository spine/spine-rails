require 'rails'
require 'spine/generators'

module Spine
  module Generators
    class ControllerGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine controller"

      def create_controller
        template "controller.coffee.erb", File.join(
          "app/assets/javascripts", 
          app_name, "controllers", 
          class_path, file_name.pluralize + ".coffee"
        )
        generate_jasmine_spec object_name, "controllers"
      end
    end
  end
end
