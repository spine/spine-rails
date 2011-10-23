module Spine
  module Generators
    class Base < ::Rails::Generators::NamedBase
      class_option :app, :type => :string, :default => "app", :desc => "app name"
      
      # These are just helpers, and should not be executed. Thus must be protected.
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

      def view_format
        if defined?(::Eco)
          'eco'
        elsif defined?(::RubyHamlJs)
          'hamljs'
        else
          'ejs'
        end
      end

      def object_name
        file_name.camelize
      end

      def generate_jasmine_spec subject, path
        return false unless defined?(::Jasmine)
        variable_name = "#{subject.underscore}"

        # TODO: Consider moving this into a template
        create_file "spec/javascripts/#{app_name}/#{path}/#{variable_name}_spec.coffee", <<-SPEC
describe "#{subject}", ->
  #{variable_name} = null
  beforeEach -> # init #{variable_name} here
    
  it "should be tested", ->
    expect(#{variable_name}).toBeTruthy()
SPEC
      end
    end
  end
end
