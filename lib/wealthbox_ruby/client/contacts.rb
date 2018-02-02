module WealthboxRuby
  class Client
    module Contacts
      def search_contacts(search_query, options = {})
        contacts = get 'contacts', {query: { name: search_query}}
        contacts['contacts'].map { |contact_params| WealthboxRuby::Models::Contact.new contact_params, self }
      end

      def contacts
        contacts = get 'contacts'
        contacts['contacts'].map { |contact_params| WealthboxRuby::Models::Contact.new contact_params, self }
      end

      def contact(contact_id)
        contact = get "contacts/#{contact_id}"
        WealthboxRuby::Models::Contact.new contact, self
      end
    end
  end
end