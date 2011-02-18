module Typus
  module Authentication
    module PickardAyune

      protected

      include Base

      def authenticate
        if current_user.present?
          redirect_to root_path unless %W(spraints farmingengineer).include?(current_user.login_account.login)
        else
          require_user
        end
      end

      def admin_user
        current_user
      end
    end
  end
end
