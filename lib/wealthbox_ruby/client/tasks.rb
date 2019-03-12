module WealthboxRuby
  class Client
    module Tasks

      def tasks
        tasks = get 'tasks'
        tasks['tasks'].map { |task_params| WealthboxRuby::Models::Task.new task_params, self }
      end

      def tasks_for_contact(contact_id)
        query = { resource_type: :contact, resource_id: contact_id }
        tasks = get('tasks', { query: query })

        tasks['tasks'].map { |task_params| WealthboxRuby::Models::Task.new task_params, self }
      end

      def task(task_id)
        task = get "tasks/#{task_id}"
        WealthboxRuby::Models::Task.new task, self
      end

      def create_task(params)
        task = WealthboxRuby::Models::Task.new params, self
        task.save
      end

      def update_task(task_id, params)
        task = WealthboxRuby::Models::Task.new params.merge(id: task_id), self
        task.save
      end

      def delete_task(task_id)
        task = WealthboxRuby::Models::Task.new({id: task_id}, self)
        task.remove
      end
    end
  end
end
