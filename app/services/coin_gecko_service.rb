class CoinGeckoService
  include HTTParty
  base_uri "https://api.coingecko.com/api/v3"

  API_KEY = ENV["COINGECKO_API_KEY"]

  def self.fetch_price(symbol)

    response = get(
      "/simple/price",
      query: {
        ids: symbol,
        vs_currencies: "usd"
      },
      headers: {
        "x-cg-demo-api-key" => API_KEY
      }
    )

    raise "API Error" unless response.success?

    response[symbol]["usd"]
  end

end