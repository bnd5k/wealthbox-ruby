module WealthboxRuby
  class Client
    module Contacts

      # search_query examples: {name: 'John Appleseed'} or {email: 'foobar@example.com'}
      def search_contacts(search_query = {})
        contacts = get('contacts', {query: search_query})
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

      def create_contact(params)
        contact = WealthboxRuby::Models::Contact.new params, self
        contact.save
      end

      def update_contact(contact_id, params)
        contact = WealthboxRuby::Models::Contact.new params.merge(id: contact_id), self
        contact.save
      end

      def delete_contact(contact_id)
        contact = WealthboxRuby::Models::Contact.new({id: contact_id}, self)
        contact.remove
      end
    end
  end
end
