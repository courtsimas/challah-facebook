require 'challah/facebook/version'

module Challah
  module Facebook
    autoload :Interface,        'challah/facebook/interface'
    autoload :Provider,         'challah/facebook/provider'
    autoload :Technique,        'challah/facebook/technique'
    autoload :Interfaces,       'challah/facebook/interfaces'

    def self.options
      @options ||= {
        app_id:       ENV['FACEBOOK_APP_ID'],
        app_secret:   ENV['FACEBOOK_SECRET'],
        permissions:  (ENV['FACEBOOK_PERMISSIONS'] || 'email').to_s.split(','),
        user_fields:  %w( first_name last_name email )
      }
    end

    %w( app_id app_secret permissions user_fields ).each do |m|
      class_eval "def self.#{m}; self.options[:#{m}]; end"
    end

    # The interface to use for all Facebook commands.
    #
    # Override this as needed. The Facebook interface should respond
    # to all methods in Interfaces::Base
    def self.interface
      @interface ||= Interface
    end

    def self.interface=(klass)
      @interface = klass
    end

    # Delegate all other methods to Challah::Facebook to the interface
    def self.method_missing(method, *args)
      self.interface.send(method, *args)
    end
  end
end