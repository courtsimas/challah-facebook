module Challah
  module Facebook
    module Interfaces
      class Simple < Base
        class OAuth
          attr_reader :interface, :callback_url

          GRAPH_SERVER = 'graph.facebook.com'

          def initialize(interface, callback_url = nil)
            @interface    = interface
            @callback_url = callback_url
          end

          def url_for_auth_code(options = {})
            params = options.merge({
              client_id: interface.app_id,
              redirect_uri: callback_url
            })

            "https://#{GRAPH_SERVER}/oauth/access_token?"

            params
          end
        end

        def self.mode
          "simple"
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
          scope = Facebook.permissions if permissions.nil?
          oauth = new(Facebook.options).oauth(callback_uri)
          oauth.url_for_auth_code(scope: scope)
        end

        def oauth(callback_url = nil)
          @oauth ||= OAuth.new(self, callback_url)
        end
      end
    end
  end
end