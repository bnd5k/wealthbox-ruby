module WealthboxRuby
  class Client
    module Opportunities

      def opportunities
        opportunities = get 'opportunities'
        opportunities['opportunities'].map { |opportunity_params| WealthboxRuby::Models::Opportunity.new opportunity_params, self }
      end

      def opportunities_for_contact(contact_id)
        query = { resource_type: :contact, resource_id: contact_id }
        opportunities = get('opportunities', { query: query })

        opportunities['opportunities'].map { |opportunity_params| WealthboxRuby::Models::Opportunity.new opportunity_params, self }
      end

      def opportunity(opportunity_id)
        opportunity = get "opportunities/#{opportunity_id}"
        WealthboxRuby::Models::Opportunity.new opportunity, self
      end

      def create_opportunity(params)
        opportunity = WealthboxRuby::Models::Opportunity.new params, self
        opportunity.save
      end

      def update_opportunity(opportunity_id, params)
        opportunity = WealthboxRuby::Models::Opportunity.new params.merge(id: opportunity_id), self
        opportunity.save
      end

      def delete_opportunity(opportunity_id)
        opportunity = WealthboxRuby::Models::Opportunity.new({id: opportunity_id}, self)
        opportunity.remove
      end
    end
  end
end
