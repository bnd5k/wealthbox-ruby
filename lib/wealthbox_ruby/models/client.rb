module WealthboxRuby
  module Models
    class Client < APIModel
      attribute :id, Integer
      attribute :advisor_user_id, Integer
      attribute :client_user_id, Integer
      attribute :created, DateTime
      attribute :email, String
      attribute :fname, String
      attribute :lname, String
      attribute :integrations, Array
      attribute :latest_current_portfolio, Integer
      attribute :latest_proposed_portfolio, Integer
      attribute :latest_alloclog_id, Integer
      attribute :messages, Array
      attribute :next_review_date, DateTime
      attribute :photo_path, String
      attribute :phone, String
      attribute :photo_path, String
      attribute :portfolios, Array[Portfolio]
      attribute :prev_review_date, DateTime
      attribute :next_review_date, DateTime
      attribute :questionnaires, Array
      attribute :retirements, Array
      attribute :risk_number, Integer
      attribute :status, String
      attribute :deleted, Boolean
      attribute :ref_id, String
      attribute :risk_metric, Hash
      attribute :retirements, Array
      attribute :meetings_code, String
      attribute :available_models, Array
      attribute :share_data, Hash
      attribute :permissions, Hash
      attribute :application_id, Integer

      def current_portfolio
        @client.portfolio(latest_current_portfolio)
      end

      def proposed_portfolio
        @client.portfolio(latest_proposed_portfolio)
      end

    end
  end
end
