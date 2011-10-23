require "rails"
require "spine/generators"

module Spine
  module Generators
    class ScaffoldGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine scaffold with configured fields"

      argument :fields, :desc => "List of model attributes", :type => :array, :banner => "field1 field2"
      
      def model_name
        file_name.singularize
      end
      
      def model_class
        class_name.singularize
      end
      
      def controller_name
        file_name.pluralize
      end
      
      def controller_class
        class_name.pluralize
      end
      
      def create_scaffold
        raise("eco or ruby-haml-js gem required - please add to Gemfile") if view_format == 'ejs'

        generate "spine:model #{model_name} #{fields.join(" ")} --app #{app_name}"
        template "controller.coffee.erb", "app/assets/javascripts/#{app_name}/controllers/#{controller_name}.js.coffee"
        %w{new edit index show}.each {|name| scaffold_view name }
      end

      protected

      def scaffold_view name
        template "#{view_format}/#{name}.erb",  "app/assets/javascripts/#{app_name}/views/#{controller_name}/#{name}.jst.#{view_format}"
      end

    end
  end
end
