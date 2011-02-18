module Typus
  module Authentication
    module PickardAyune

      protected

      include Typus::Authentication::Omnisocial

      def authenticate ; debugger
        if current_user.present?
          redirect_to root_path unless %W(spraints farmingengineer).include?(current_user.login_account.login)
        else
          super
        end
      end
    end
  end
end
