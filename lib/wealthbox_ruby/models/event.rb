module WealthboxRuby
  module Models
    class Event < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :title, String
      attribute :starts_at, DateTime
      attribute :ends_at, DateTime
      attribute :repeats, Boolean
      attribute :event_category, Integer
      attribute :all_day, Boolean
      attribute :location, String
      attribute :description, String
      attribute :state, String
      attribute :visible_to, String
      attribute :email_invitees, Integer
      attribute :linked_to, Array # Array of Contacts
      attribute :invitees, Array # Array of Contacts

      json_attributes :id, :creator, :created_at, :updated_at, :title, :starts_at, :ends_at,
        :repeats, :event_category, :all_day, :location, :state, :visible_to, :email_invitees, :linked_to, :invitees

      def save
        if @id
          response = @client.put "events/#{@id}", {body: json_params}
        else
          response = @client.post "events", {body: json_params}
        end

        self.class.new response, self
      end
    end
  end
end
