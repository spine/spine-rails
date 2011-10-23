require 'rails'
require 'spine/generators'

module Spine
  module Generators
    class ModelGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine model with configured fields"

      argument :fields, :desc => 'List of model attributes', :type => :array, :banner => 'field1 field2'

      def create_model
        template "model.coffee.erb", "app/assets/javascripts/#{app_name}/models/#{file_name}.js.coffee"
        generate_jasmine_spec object_name, "models"
      end
    end
  end
end
