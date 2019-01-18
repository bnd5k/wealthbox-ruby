module WealthboxRuby
  module Models
    class Workflow < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :label, String
      attribute :linked_to, Hash
      attribute :visible_to, String
      # Workflow_tempalte is workflow_template_id when creating Workflow but
      # server will send back an object rather than just an id
      attribute :workflow_template, Integer

      def save
        if @id
          response = @client.put "workflows/#{@id}", {body: json_params}
        else
          response = @client.post "workflows", {body: json_params}
        end

        self.class.new response, self
      end

      def remove
        response = @client.delete "workflows/#{id}"
        self.class.new response, self
      end

    end
  end
end
