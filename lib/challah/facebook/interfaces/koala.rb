module Challah
  module Facebook
    module Interfaces
      class Koala < Base
        def self.mode
          "koala"
        end

        def self.get_access_token_for_oauth_code(code, callback_uri)
          auth = new(Facebook.options).auth(callback_uri)
          auth.get_access_token(code)
        end

        def self.get_extended_token(access_token)
          auth = new(Facebook.options).auth
          token_hash = auth.exchange_access_token_info(access_token)
          token_hash.fetch('access_token')
        end

        def self.get_facebook_uid_from_access_token(access_token)
          fb_user = get_user_object_from_access_token(access_token)

          if fb_user
            return fb_user.fetch('id').to_s
          end

          nil
        rescue
          nil
        end

        def self.get_user_info_from_access_token(access_token)
          result = {}

          fb_user = get_user_object_from_access_token(access_token)

          Facebook.user_fields.each do |field|
            if fb_user.has_key?(field)
              result[field] = fb_user[field]
            else
              result[field] = nil
            end
          end

          result
        end

        def self.get_user_object_from_access_token(access_token)
          graph = ::Koala::Facebook::API.new(access_token)
          graph.get_object('me')
        end

        def self.get_authorization_url(callback_uri, permissions = nil)
          scope = Facebook.permissions if permissions.nil?
          auth = new(Facebook.options).auth(callback_uri)
          auth.url_for_oauth_code(permissions: scope)
        end

        def auth(callback_url = nil)
          @auth ||= ::Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
        end
      end
    end
  end
end