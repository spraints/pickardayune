module Typus
  module Authentication
    module Omnisocial

      protected

      include Base

      def authenticate
        require_user
      end

      def admin_user
        current_user.extend(AdminUserAdapter)
      end

      module AdminUserAdapter
        def can?(*args)
          true
        end

        def cannot?(*args)
          !can?(*args)
        end

        def is_root?
          true
        end

        def is_not_root?
          true
        end

        def locale
          ::I18n.locale
        end

        def applications
          Typus.applications
        end

        def application(name)
          Typus.application(name)
        end

        def role
          Typus.master_role
        end

        def status
          true
        end
      end
    end
  end
end
