module Wealthbox
  module Models
    class APIModel < Base
      def initialize(attrs = {}, client = nil)
        super attrs
        @client = client
      end
    end
  end
end
