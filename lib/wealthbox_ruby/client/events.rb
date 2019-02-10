module WealthboxRuby
  class Client
    module Events

      def events
        events = get 'events'
        events['events'].map { |event_params| WealthboxRuby::Models::Event.new event_params, self }
      end

      def event(event_id)
        event = get "events/#{event_id}"
        WealthboxRuby::Models::Event.new event, self
      end

      def create_event(params)
        event = WealthboxRuby::Models::Event.new params, self
        event.save
      end

      def update_event(event_id, params)
        event = WealthboxRuby::Models::Event.new params.merge(id: event_id), self
        event.save
      end

      def delete_event(event_id)
        event = WealthboxRuby::Models::Event.new({id: event_id}, self)
        event.remove
      end
    end
  end
end
