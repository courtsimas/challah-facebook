require 'challah/facebook/interfaces/base'

# Set up the proper interface depending on installed gems
if defined?(FbGraph)
  require 'challah/facebook/interfaces/fb_graph'

  module Challah
    module Facebook
      class Interface < Challah::Facebook::Interfaces::FbGraph
      end
    end
  end
elsif defined?(Koala)
  require 'challah/facebook/interfaces/koala'

  module Challah
    module Facebook
      class Interface < Challah::Facebook::Interfaces::Koala
      end
    end
  end
else
  module Challah
    module Facebook
      class Interface
        def self.mode
          "none"
        end

        def method_missing
          raise "No Facebook adapter found. Please install fb_graph or koala gem to use Facebook"
        end
      end
    end
  end
end