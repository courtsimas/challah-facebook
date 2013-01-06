module Challah
  module Facebook
    module Interfaces
      class FbGraph < Base
        def self.mode
          "fb_graph"
        end

        def self.get_access_token_for_oauth_code(code, callback_uri)
          client = new(Facebook.options).auth(callback_uri).client
          client.authorization_code = code
          client.access_token!(:client_auth_body).to_s
        end

        def self.get_extended_token(access_token)
          fb_auth = new(Facebook.options).auth
          fb_auth.exchange_token!(access_token)
          fb_auth.access_token.to_s
        end

        def self.get_facebook_uid_from_access_token(access_token)
          fb_user = get_user_object_from_access_token(access_token)

          if fb_user
            return fb_user.identifier.to_s
          end

          nil
        rescue
          nil
        end

        def self.get_user_info_from_access_token(access_token)
          result = {}

          fb_user = get_user_object_from_access_token(access_token)

          Facebook.user_fields.each do |field|
            if fb_user.respond_to?(field)
              result[field] = fb_user.send(field)
            else
              result[field] = nil
            end
          end

          result
        end

        def self.get_user_object_from_access_token(access_token)
          ::FbGraph::User.me(access_token).fetch
        end

        def self.get_authorization_url(callback_uri, permissions = nil)
          scope = Facebook.permissions if permissions.nil?
          client = new(Facebook.options).auth(callback_uri).client
          client.authorization_uri(scope: scope)
        end

        def auth(callback_uri = nil)
          ::FbGraph::Auth.new(app_id, app_secret, redirect_uri: callback_uri)
        end
      end
    end
  end
end