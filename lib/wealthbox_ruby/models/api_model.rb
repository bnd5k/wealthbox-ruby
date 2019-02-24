module WealthboxRuby
  module Models
    class APIModel < Base

      def initialize(attrs = {}, client = nil)
        super attrs
        @client = client
      end

      def json_params
        formatted_params = self.attributes.keys.inject({}) do |params, jsa|
          val = self.send(jsa)

          next params if val.nil?
          next params if val.is_a?(Array) && val.length == 0
          next params if val.is_a?(Hash) && !val.keys.any?

          if val.is_a?(DateTime)
            val = val.strftime('%Y-%m-%dT%H:%M:%S%z')
          end

          if val.is_a?(Date)
            val = val.strftime('%F')
          end

          params[jsa] = val
          params
        end
        formatted_params.to_json
      end

    end
  end
end
