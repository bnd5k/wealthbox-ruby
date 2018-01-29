module WealthboxRuby
  class Client
    module Clients
      def search_clients(search_query, options = {})
        clients = get 'contacts', {query: { name: search_query}}
        # clients.map { |client_params| WealthboxRuby::Models::Client.new client_params, self }
      end

      def clients
        clients = get 'clients'
        clients.map{ |client_params| WealthboxRuby::Models::Client.new client_params, self }
      end

      def client(client_id)
        client = get "clients/#{client_id}"
        WealthboxRuby::Models::Client.new client, self
      end
    end
  end
end