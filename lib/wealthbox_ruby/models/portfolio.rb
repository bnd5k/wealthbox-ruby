module Wealthbox
  module Models
    class Portfolio < Base
      attribute :id, Integer
      attribute :user_id, Integer
      attribute :client_id, Integer
      attribute :name, String
      attribute :total, Integer
      attribute :analysis, Analysis
      attribute :settings, Array
      attribute :status, String
      attribute :type, String
      attribute :created, DateTime
      attribute :updated, DateTime
      attribute :analyzed, DateTime
      attribute :is_dirty, Boolean
      attribute :deleted, Integer
      attribute :data_model, Integer
      attribute :accounts, Array[Account]
      attribute :rsk_user_id, Integer
      attribute :tags, Array
      attribute :accounts_excluded, Array[Account]
      attribute :data_models, Array[DataModel]
      attribute :segments, Array
      attribute :config, Hash
      attribute :syncing, Hash
      attribute :share_data, Hash
      attribute :permissions, Hash
      attribute :result, String
    end
  end
end