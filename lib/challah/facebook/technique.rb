module Challah
  module Facebook
    class Technique
      def initialize(session)
        @provider = session.provider? ? session.provider : nil
        @token = session.token? ? session.token : nil
        @uid = session.uid? ? session.uid : nil
      end

      def authenticate
        return nil unless @provider == 'facebook'
        return nil unless @token

        token = Interface.get_extended_token(@token)
        auth = ::Authorization.where(provider: 'facebook', token: token, uid: @uid).first

        if auth
          return auth.user
        end

        nil
      end

      def persist?
        true
      end
    end
  end
end