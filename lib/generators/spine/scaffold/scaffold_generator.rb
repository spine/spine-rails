require "rails"
require "spine/generators"

module Spine
  module Generators
    class ScaffoldGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine scaffold with configured fields"

      argument :fields, :desc => "List of model attributes", :type => :array, :banner => "field1 field2"
      
      def create_scaffold
        raise("The 'eco' gem is required; add it to the Gemfile") unless defined?(::Eco)
        
        generate "spine:model #{model_name} #{fields.join(" ")} --app #{app_name}"
        template "controller.coffee.erb", "app/assets/javascripts/#{app_name}/controllers/#{controller_name}.js.coffee"
        template "edit.jst.erb",  "app/assets/javascripts/#{app_name}/views/#{controller_name}/edit.jst.eco"
        template "index.jst.erb", "app/assets/javascripts/#{app_name}/views/#{controller_name}/index.jst.eco"
        template "new.jst.erb",   "app/assets/javascripts/#{app_name}/views/#{controller_name}/new.jst.eco"
        template "show.jst.erb",  "app/assets/javascripts/#{app_name}/views/#{controller_name}/show.jst.eco"
      end
      
      protected
        
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
    end
  end
end