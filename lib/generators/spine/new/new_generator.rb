require 'rails'

module Spine
  module Generators

    class NewGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
  
      desc "This generator installs Spine #{Spine::Rails::SPINE_VERSION} as part of assets pipeline"
      
      class_option :app, :type => :string, :default => "app", :desc => "app name"
      
      def app_name
        options[:app]
      end
      
      def app_class
        app_name.camelize
      end
          
      def create_dir_layout
        %W{models views controllers}.each do |dir|
          empty_directory "app/assets/javascripts/#{app_name}/#{dir}" 
          create_file "app/assets/javascripts/#{app_name}/#{dir}/.gitkeep"
        end
      end
    
      def create_app_file
        template "index.coffee.erb", "app/assets/javascripts/#{app_name}/index.coffee"
      end
     
      def add_spine_app_to_application
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require #{app_name}/index\n"
        end
      end
    end

  end
end
