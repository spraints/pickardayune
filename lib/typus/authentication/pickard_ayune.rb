module Typus
  module Authentication
    module PickardAyune

      protected

      include Base

      def authenticate
        require_user
      end

      def admin_user
        current_user
      end
    end
  end
end
