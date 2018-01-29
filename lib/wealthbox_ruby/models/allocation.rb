module WealthboxRuby
  module Models
    class Allocation < Base
      attribute :id, Integer
      attribute :account_id, Integer
      attribute :portfolio_id, Integer
      attribute :sec_id, Integer
      attribute :parent_model_version_id, Integer
      attribute :order, Integer
      attribute :analysis, Analysis
      attribute :settings, Hash
      attribute :data, Hash
      attribute :messages, Array[Hash]
      attribute :rank, Integer
      attribute :hash, Hash
      attribute :price, Float
      attribute :shares, Integer
      attribute :amount, Float
      attribute :value_as_of_date, DateTime
      attribute :is_locked_for_trading, Boolean
      attribute :permissions, Array
      attribute :security, Hash
      attribute :tax_lots, Array
      attribute :adjustments, Hash
      attribute :data_model_modes, Array
    end
  end
end
