module WealthboxRuby
  class Client
    module Portfolios
      def portfolios
        portfolios = get 'portfolios'
        portfolios["data"].map{ |portfolio_params| WealthboxRuby::Models::Portfolio.new portfolio_params }
      end

      def portfolio(portfolio_id)
        portfolio = get "portfolios/#{portfolio_id}"
        WealthboxRuby::Models::Portfolio.new portfolio
      end
    end
  end
end