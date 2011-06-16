require 'rails'

module Spine
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs Spine #{Spine::Rails::SPINE_VERSION}"

      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def copy_spine
        say_status("copying", "Spine (#{Spine::Rails::SPINE_VERSION})", :green)
        copy_file "spine.js", "public/javascripts/spine.js"
        copy_file "spine.min.js", "public/javascripts/spine.min.js"
      end
    end
  end
end if ::Rails.version < "3.1"
