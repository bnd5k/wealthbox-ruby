module WealthboxRuby
  class Client
    module Workflows

      def workflows
        workflows = get 'workflows'
        workflows['workflows'].map { |workflow_params| WealthboxRuby::Models::Workflow.new workflow_params, self }
      end

      def workflows_for_contact(contact_id)
        query = { resource_type: :contact, resource_id: contact_id }
        workflows = get('workflows', { query: query })

        workflows['workflows'].map { |workflow_params| WealthboxRuby::Models::Workflow.new workflow_params, self }
      end

      def workflow(workflow_id)
        workflow = get "workflows/#{workflow_id}"
        WealthboxRuby::Models::Workflow.new workflow, self
      end

      def create_workflow(params)
        workflow = WealthboxRuby::Models::Workflow.new params, self
        workflow.save
      end

      def update_workflow(workflow_id, params)
        workflow = WealthboxRuby::Models::Workflow.new params.merge(id: workflow_id), self
        workflow.save
      end

      def delete_workflow(workflow_id)
        workflow = WealthboxRuby::Models::Workflow.new({id: workflow_id}, self)
        workflow.remove
      end
    end
  end
end
