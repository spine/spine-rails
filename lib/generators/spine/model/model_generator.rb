require 'rails'

module Spine
  module Generators
    class ModelGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine model with configured fields"

      argument :fields, :desc => 'List of fields of the model', :type => :array, :banner => 'field1 field2'

      def create_model
        template "model.coffee.erb", "app/assets/javascripts/models/#{file_name}.js.coffee"
      end
    end
  end
end
