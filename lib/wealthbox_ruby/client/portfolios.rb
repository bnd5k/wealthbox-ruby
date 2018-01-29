module Wealthbox
  class Client
    module Portfolios
      def portfolios
        portfolios = get 'portfolios'
        portfolios["data"].map{ |portfolio_params| Wealthbox::Models::Portfolio.new portfolio_params }
      end

      def portfolio(portfolio_id)
        portfolio = get "portfolios/#{portfolio_id}"
        Wealthbox::Models::Portfolio.new portfolio
      end
    end
  end
end