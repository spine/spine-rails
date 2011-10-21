require 'rails'

module Spine
  module Generators
    class ControllerGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine controller"

      def create_controller
        template "controller.coffee.erb", "app/assets/javascripts/#{app_name}/controllers/#{file_name}.coffee"
      end
    end
  end
end
