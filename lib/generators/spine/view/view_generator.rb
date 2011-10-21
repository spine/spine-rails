require 'rails'
require 'spine/generators'

module Spine
  module Generators
    class ViewGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine view, eg: posts/index"

      # rails g spine:view Users index edit show
      def create_views
        view_format = if defined?(::Eco)
          'eco'
        elsif defined?(::RubyHamlJs)
          'hamljs'
        else
          'ejs'
        end
        
        template "view.#{view_format}.erb", File.join(
          "app/assets/javascripts", 
          app_name, "views", 
          class_path, file_name + ".jst.#{view_format}"
        )
      end
    end
  end
end
