module WealthboxRuby
  module Models
    class Account < Base
      attribute :id, Integer
      attribute :porfolio_id, Integer
      attribute :asset_manager_id, Integer
      attribute :custodian_id, Integer
      attribute :type_id, Integer

      attribute :name, String
      attribute :total, Integer
      attribute :status, String
      attribute :type, String
      attribute :order, Integer
      attribute :analysis, Analysis
      attribute :messages, Array

      attribute :created, DateTime
      attribute :updated, DateTime
      attribute :synced, DateTime
      attribute :settings, Hash
      attribute :data, Hash
      attribute :external_config, Hash
      attribute :integrations, Array
      attribute :tracked_model_id, Integer
      attribute :is_autopilot_enabled, Boolean
      attribute :trading_status, String
      attribute :allocations, Array[Allocation]
      attribute :allocations_excluded, Array[Allocation]
      attribute :is_autopilot_eligible, Boolean
    end
  end
end
