RSpec.describe PricesController do

  it "returns cached value" do

    Rails.cache.write("bitcoin", 70000)

    get :show,
      params: {
        symbol: "bitcoin"
      }

    body = JSON.parse(response.body)

    expect(body["price"]).to eq(70000)

  end

end