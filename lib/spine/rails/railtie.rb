module Jquery
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if ::Rails.root.join("public/javascripts/spine.min.js").exist?
          sp_defaults = %w(spine)
          sp_defaults.map! {|a| a + ".min" } if ::Rails.env.production?
        else
          sp_defaults = ::Rails.env.production? ? %w(spine.min) : %w(spine)
        end

        config.action_view.javascript_expansions[:defaults] |= sp_defaults
      end
    end
  end
end
