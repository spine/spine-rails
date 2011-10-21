module Spine
  module Generators
    class Base < ::Rails::Generators::NamedBase
      class_option :app, :type => :string, :default => "app", :desc => "app name"
      
      def app_name
        options[:app]
      end
    end
  end
end