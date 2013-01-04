module Challah
  module Facebook
    module Interfaces
      class Base
        attr_reader :app_id, :app_secret

        def self.app_id
          ENV['FACEBOOK_APP_ID']
        end

        def self.app_secret
          ENV['FACEBOOK_SECRET']
        end

        def self.permissions
          ENV['FACEBOOK_PERMISSIONS'].to_s.split(',')
        end

        def self.user_fields
          %w( first_name last_name email )
        end

        def initialize(app_id, app_secret)
          @app_id = app_id
          @app_secret = app_secret
        end

        def self.get_access_token_for_oauth_code(code, callback_uri)
          raise 'Not implemented: get_access_token_for_oauth_code'
        end

        def self.get_access_token_from_cookies(cookies_hash)
          raise 'Not implemented: get_access_token_from_cookies'
        end

        def self.get_facebook_uid_from_access_token(access_token)
          raise 'Not implemented: get_facebook_uid_from_access_token'
        end

        def self.get_authorization_url(callback_uri, permissions = nil)
          raise 'Not implemented: get_authorization_url'
        end
      end
    end
  end
end