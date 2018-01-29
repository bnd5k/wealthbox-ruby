module Wealthbox
  class Client
    module Clients
      def search_clients(search_query, options = {})
        clients = get 'clients/search', {query: { q: search_query}}
        clients.map { |client_params| Wealthbox::Models::Client.new client_params, self }
      end

      def clients
        clients = get 'clients'
        clients.map{ |client_params| Wealthbox::Models::Client.new client_params, self }
      end

      def client(client_id)
        client = get "clients/#{client_id}"
        Wealthbox::Models::Client.new client, self
      end
    end
  end
end