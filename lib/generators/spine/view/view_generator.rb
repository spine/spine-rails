require 'rails'

module Spine
  module Generators
    class ViewGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine views grouped by the name of the NAME argument"

      # rails g spine:view Users index edit show
      def create_views
        view_format = if defined?(::Eco)
          'eco'
        elsif defined?(::RubyHamlJs)
          'hamljs'
        else
          'ejs'
        end

        template "view.#{view_format}.erb", "app/assets/javascripts/#{app_name}/views/#{file_name}.jst.#{view_format}"
      end
    end
  end
end
