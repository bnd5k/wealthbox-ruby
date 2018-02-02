module WealthboxRuby
  module Connection
    def get(url, options = {})
      request :get, url, options
    end

    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    protected

    def endpoint
      @api_endpoint
    end

    private

    def request(method, path, options = {})
      options[:headers] = headers.merge(options[:headers] || {})
      handle_response(HTTParty.send(method, URI::Parser.new.escape("#{endpoint}/#{path.to_s}"), options))
    end

    def headers
      {
        'Accept' => 'application/json',
        'ACCESS_TOKEN' => @access_token
      }
    end

    def handle_response(response)
      if response.code != 200
        case response.code
          when 401
            raise AuthorizationError.new(response.response.msg)
          else
            raise RequestError.new(response.response.msg)
        end
      end

      response.parsed_response
    end

  end
end