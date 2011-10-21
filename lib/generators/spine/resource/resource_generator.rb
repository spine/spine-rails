require 'rails'

module Spine
  module Generators
    class ResourceGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Generate Spine Model, Controller and Views"

      argument :fields, :desc => 'List of fields of the model', :type => :array, :banner => 'field1 field2'

      def generate_all
        generate "spine:model #{file_name.capitalize} #{fields.join(' ')}"
        generate "spine:controller #{file_name.pluralize}"
        generate "spine:view #{file_name.pluralize} index show edit"
      end
    end
  end
end
