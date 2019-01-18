module WealthboxRuby
  module Models
    class Task < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :name, String
      attribute :due_date, DateTime
      attribute :description, String
      attribute :assigned_to, Integer
      attribute :complete, Boolean
      attribute :repeats, Boolean
      attribute :category, Integer
      attribute :linked_to, Array # Array of Contacts
      attribute :priority, String
      attribute :visible_to, String

      def save
        if @id
          response = @client.put "tasks/#{@id}", {body: json_params}
        else
          response = @client.post "tasks", {body: json_params}
        end

        self.class.new response, self
      end
    end
  end
end
