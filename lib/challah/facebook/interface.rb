require 'challah/facebook/interfaces/base'

# Set up the proper interface depending on installed gems
if defined?(FbGraph)
  require 'challah/facebook/interfaces/fb_graph'

  module Challah
    module Facebook
      class Interface < Interfaces::FbGraph
      end
    end
  end
elsif defined?(Koala)
  require 'challah/facebook/interfaces/koala'

  module Challah
    module Facebook
      class Interface < Interfaces::Koala
      end
    end
  end
else
  require 'challah/facebook/interfaces/simple'

  module Challah
    module Facebook
      class Interface < Interfaces::Simple
      end
    end
  end
end