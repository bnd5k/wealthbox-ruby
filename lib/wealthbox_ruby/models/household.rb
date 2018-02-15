module WealthboxRuby
  module Models
    class Household < Base
      attribute :id, Integer
      attribute :name, String
      attribute :title, String
      attribute :members, Array
    end
  end
end