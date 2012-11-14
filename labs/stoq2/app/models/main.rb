class Main
  def self.run
    puts "Creating user:"
    puts "name?"
    name = gets.chomp

    u1 = User.create(:name => name)

    stock_names = []

    3.times do 
      puts "Creating a stock"
      puts "Symbol?"
      symbol = gets.chomp.upcase
      stock_names << symbol
    end

    while true
      sleep 1
      stock_names.each do |symbol|
        begin
          quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
          stock = Stock.create(:symbol => symbol, :quote => quote)
          u1.stocks << stock     
        rescue
        end
      end
    end
  end
end
