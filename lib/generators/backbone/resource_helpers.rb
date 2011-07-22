module Backbone
  module Generators
    module ResourceHelpers
      
      def backbone_path
        "app/assets/javascripts/backbone"
      end
      
      def model_namespace
        [application_name.capitalize, "Models", class_name].join(".")
      end
      
      def collection_namespace
        [application_name.capitalize, "Collections", plural_name.capitalize].join(".")
      end
      
      def view_namespace
        [application_name.capitalize, "Views", plural_name.capitalize].join(".")
      end
      
      def router_namespace
        [application_name.capitalize, "Routers", plural_name.capitalize].join(".")
      end
      
      def jst(action)
        "#{plural_name}_#{action}_jst"
      end
      
    end
  end
end