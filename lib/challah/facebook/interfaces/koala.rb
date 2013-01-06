module Challah
  module Facebook
    module Interfaces
      class Koala < Base
        def self.mode
          "koala"
        end

        def self.get_access_token_for_oauth_code(code, callback_uri)
          raise 'Not implemented: get_access_token_for_oauth_code'
        end

        def self.get_extended_token(access_token)
          raise 'Not implemented: get_extended_token'
        end

        def self.get_facebook_uid_from_access_token(access_token)
          raise 'Not implemented: get_facebook_uid_from_access_token'
        end

        def self.get_user_info_from_access_token(access_token)
          raise 'Not implemented: get_user_info_from_access_token'
        end

        def self.get_authorization_url(callback_uri, permissions = nil)
          raise 'Not implemented: get_authorization_url'
        end
      end
    end
  end
end