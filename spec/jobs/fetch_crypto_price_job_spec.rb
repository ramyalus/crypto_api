RSpec.describe FetchCryptoPriceJob do
  it "stores fetched price" do
    allow(CoinGeckoService)
      .to receive(:fetch_price)
      .and_return(64000)

    described_class.perform_now("bitcoin")
    expect(
      Price.last.value
    ).to eq(64000)
  end
  
  it "keeps old price if API fails" do
    Price.create!(
      symbol: "bitcoin",
      value: 50000
    )
    allow(CoinGeckoService)
      .to receive(:fetch_price)
      .and_raise(StandardError)
    described_class.perform_now("bitcoin")
    expect(
      Price.first.value
    ).to eq(50000)
  end
end