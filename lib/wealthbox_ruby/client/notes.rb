module WealthboxRuby
  class Client
    module Notes

      def notes
        notes = get 'notes'
        notes['status_updates'].map { |note_params| WealthboxRuby::Models::Note.new note_params, self }
      end

      def note(note_id)
        note = get "notes/#{note_id}"
        WealthboxRuby::Models::Note.new note, self
      end

      def create_note(params)
        note = WealthboxRuby::Models::Note.new params, self
        note.save
      end

      def update_note(note_id, params)
        note = WealthboxRuby::Models::Note.new params.merge(id: note_id), self
        note.save
      end

      def delete_note(note_id)
        note = WealthboxRuby::Models::Note.new({id: note_id}, self)
        note.remove
      end
    end
  end
end
