require 'rails'

module Spine
  module Generators
    class ViewGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate a Spine views grouped by the name of the NAME argument"

      argument :actions, :desc => 'The names of the views', :type => :array, :banner => 'index show edit whatever'

      def create_views_directory
        empty_directory "app/assets/javascripts/views/#{file_name}"
      end

      # rails g spine:view Users index edit show
      def create_views
        view_format = if defined?(::Eco)
          'eco'
        elsif defined?(::RubyHamlJs)
          'hamljs'
        else
          'ejs'
        end

        actions.each do |view_name|
          template "view.#{view_format}.erb", "app/assets/javascripts/views/#{file_name}/#{view_name}.jst.#{view_format}", :view_name => view_name
        end
      end
    end
  end
end
