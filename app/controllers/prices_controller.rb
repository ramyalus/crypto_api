class PricesController < ApplicationController
  def show
    symbol = params[:symbol]
    cached = Rails.cache.read(symbol)
    if cached
      render json: {
        symbol: symbol,
        price: cached,
        source: "cache"
      }
      return
    end
    record = Price.find_by(symbol: symbol)
    if record
      render json: {
        symbol: symbol,
        price: record.value,
        source: "database"
      }
    else
      render json: {
        error: "Price not found"
      }, status: :not_found

    end
  end
end