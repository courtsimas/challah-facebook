module Challah
  module Facebook
    module Interfaces
      class FbGraph < Base
        def self.mode
          "fb_graph"
        end

        def self.get_access_token_for_oauth_code(code, callback_uri)
          client = new(app_id, app_secret).auth(callback_uri).client
          client.authorization_code = code
          client.access_token!(:client_auth_body).to_s
        end

        def self.get_access_token_from_cookies(cookies_hash)
          fb_auth = new(app_id, app_secret).auth
          fb_auth.from_cookie(cookies_hash)
          fb_auth.access_token.to_s
        rescue
          nil
        end

        def self.get_extended_token(access_token)
          fb_auth = new(app_id, app_secret).auth
          fb_auth.exchange_token!(access_token)
          fb_auth.access_token.to_s
        end

        def self.get_facebook_uid_from_access_token(access_token)
          fb_user = ::FbGraph::User.me(access_token).fetch

          if fb_user
            return fb_user.identifier.to_s
          end

          nil
        rescue
          nil
        end

        def self.get_user_info_from_access_token(access_token)
          result = {}

          fb_user = ::FbGraph::User.me(access_token).fetch

          self.user_fields.each do |field|
            result[field] = fb_user.send(field)
          end

          result
        end

        def self.get_authorization_url(callback_uri, permissions = nil)
          scope = self.permissions if scope.nil?
          client = new(app_id, app_secret).auth(callback_uri).client
          client.authorization_uri(scope: scope)
        end

        def auth(callback_uri = nil)
          ::FbGraph::Auth.new(app_id, app_secret, redirect_uri: callback_uri)
        end
      end
    end
  end
end