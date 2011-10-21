require 'rails'

module Spine
  module Generators
    if ::Rails.version < "3.1"
      # Rails < 3.1

      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs Spine #{Spine::Rails::SPINE_VERSION}"

        source_root File.expand_path('../../../../../app/assets/javascripts', __FILE__)

        def copy_spine
          say_status("copying", "Spine (#{Spine::Rails::SPINE_VERSION})", :green)
          copy_file "spine.js", "public/javascripts/spine.js"
          copy_file "spine.min.js", "public/javascripts/spine.min.js"
        end
      end

    else
      # Rails >= 3.1

      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)
    
        desc "This generator installs Spine #{Spine::Rails::SPINE_VERSION} as part of assets pipeline"
            
        def create_dir_layout
          %W{models views controllers}.each do |dir|
            empty_directory "app/assets/javascripts/#{dir}" 
            create_file "app/assets/javascripts/#{dir}/.gitkeep"
          end
        end
      
        def create_app_file
          copy_file "app.coffee", "app/assets/javascripts/app.js.coffee"
        end
       
        def add_spine_app_to_application
          append_file "app/assets/javascripts/application.js", "//= require app"
        end
      end

    end # if Rails.version
  end
end
