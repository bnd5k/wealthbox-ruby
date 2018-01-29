module WealthboxRuby
  module Models
    class Analysis < Base
      attribute :return, Float
      attribute :stdev, Float
      attribute :risk_number, Integer
      attribute :worst, Float
      attribute :best, Float
    end
  end
end