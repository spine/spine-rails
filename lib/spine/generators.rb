module Spine
  module Generators
    class Base < ::Rails::Generators::NamedBase
      class_option :app, :type => :string, :default => "app", :desc => "app name"
      
      protected
      
        def class_name
          (class_path + [file_name]).map!{ |m| m.camelize }.join('')
        end
      
        def app_name
          options[:app]
        end
      
        def app_class
          app_name.camelize
        end
    end
  end
end