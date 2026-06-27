class FetchCryptoPriceJob < ApplicationJob

  queue_as :default

  def perform(symbol)

    price = CoinGeckoService.fetch_price(symbol)

    record = Price.find_or_initialize_by(symbol: symbol)

    record.update!(
      value: price,
      fetched_at: Time.current
    )

    Rails.cache.write(symbol, price)

  rescue => e

    Rails.logger.error(e.message)

  end

end