require "action_view"

module HamlCoffeeAssets
  module ActionView
    # Custom resolver to prevent Haml Coffee templates from being rendered by
    # Rails for non-HTML formats, since a template name without a MIME type
    # in it would normally be a fallback for all formats.
    #
    class Resolver < ::ActionView::FileSystemResolver
      def find_templates(name, prefix, partial, details)
        if details[:formats].include?(:html)
          super
        else
          []
        end
      end
    end
  end
end
