module Wealthbox
  module Models
    class DataModel < Base
      attribute :id, Integer
      attribute :name, String
      attribute :decription, String
      attribute :market, Float
      attribute :interest, Float
      attribute :risk_number, Integer
    end
  end
end