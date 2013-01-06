module Challah
  module Facebook
    class Technique
      def initialize(session)
        @provider = session.provider? ? session.provider : nil
        @token = session.token? ? session.token : nil
        @uid = session.uid? ? session.uid.to_s.strip : nil
      end

      def authenticate
        return nil unless @provider == 'facebook'
        return nil unless @token

        auth = ::Authorization.where(provider: 'facebook', uid: @uid).first

        if auth
          token = Facebook.interface.get_extended_token(@token)
          test_uid = Facebook.interface.get_facebook_uid_from_access_token(token).to_s.strip

          # If the uid from the given token matches the provided uid, update the token
          # and allow access
          if test_uid and @uid == test_uid
            auth.update_attribute(:token, token)
            return auth.user
          end
        end

        nil
      end

      def persist?
        true
      end
    end
  end
end