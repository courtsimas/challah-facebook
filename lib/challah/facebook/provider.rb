module Challah
  module Facebook
    class Provider
      def self.save(record)
        set({
          user_id:  record.id,
          token:    record.facebook_provider.fetch(:token),
          uid:      record.facebook_provider.fetch(:uid)
        })
      end

      def self.set(options = {})
        user_id     = options.fetch(:user_id)
        uid         = options.fetch(:uid, '')
        token       = options.fetch(:token, '')

        ::Authorization.set({
          provider:   :facebook,
          user_id:    user_id,
          uid:        uid,
          token:      token
        })
      end

      def self.valid?(user)
        return false unless user.facebook_provider?

        uid = user.facebook_provider.fetch(:uid).to_s.strip
        token = user.facebook_provider.fetch(:token)

        # Both a fb_uid and access token are required
        if uid.present? and token.present?
          if ::Authorization.where(provider: 'facebook', uid: uid).count > 0
            user.errors.add :facebook, 'account has already been used'
            return false
          end

          begin
            # Get extended token
            extended_token = Interface.get_extended_token(token)
            user.facebook_provider[:token] = extended_token

            # Verify UID
            test_uid = Interface.get_facebook_uid_from_access_token(extended_token)

            # If the uid's match up, this is a valid token
            return test_uid == uid
          rescue
            return false
          end

          true
        else
          false
        end
      end
    end
  end
end