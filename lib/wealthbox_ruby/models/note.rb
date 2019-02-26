module WealthboxRuby
  module Models
    class Note < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :priority, String
      attribute :content, String
      attribute :linked_to, Array # of hashes e.g. { "id": 1, "type": "Contact", "name": "Kevin Anderson" }
      attribute :visible_to, String
      attribute :tags, Array

      def save
        if @id
          response = @client.put "notes/#{@id}", {body: json_params}
        else
          response = @client.post "notes", {body: json_params}
        end

        self.class.new response, self
      end

      def remove
        response = @client.delete "notes/#{id}"
        self.class.new response, self
      end
    end
  end
end

