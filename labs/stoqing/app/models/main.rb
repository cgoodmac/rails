class Main # does the class have to be the same name as the file
  
  def self.run

    @quote_type = YahooFinance::StandardQuote 

    (1..5).each do |i|
      puts "Enter in a stock ticker #{i}"
      ticker = gets.chomp.upcase

      selected_stock = YahooFinance::get_quotes( @quote_type, ticker )
      quote = selected_stock[ticker].lastTrade

      Stock.create(:symbol => ticker, :quote => quote)
    end

    sleep 1

    # while 1 == 1

    #   rails db

    #   stoqing_development=# select 
    #   Stock.create(:symbol => ticker, :quote => quote)
    # end  

  end

end
