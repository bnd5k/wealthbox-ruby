module WealthboxRuby
  module Models
    class Opportunity < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :name, String
      attribute :description, String
      attribute :target_close, DateTime
      attribute :probability, Integer
      attribute :stage, Integer
      attribute :manager, String
      attribute :amounts, String
      attribute :stage, String
      attribute :amounts, Array # Array of Amount, Currncy, Kind
      attribute :visible_to, String
      attribute :linked_to, Array # Array of Contacts
      attribute :custom_fields, Array

      def save
        if @id
          response = @client.put "opportunities/#{@id}", {body: json_params}
        else
          response = @client.post "opportunities", {body: json_params}
        end

        self.class.new response, self
      end

      def remove
        response = @client.delete "opportunities/#{id}"
        self.class.new response, self
      end
    end
  end
end
