require "rails_helper"

RSpec.describe "Sales", :type => :request do
  describe "POST create" do

    it "create sale creates new sale for valid body" do
      brand = Brand.create(:name => "Brand A")
      County.create(:name => "County A",
                                   :tax => 10,
                                   :mark_up => 30)
      Product.create(:name => "Product A",
                                :cost_price => 10,
                                :brand => brand)

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/sales", :params => '{
          "items" :
              [{
                  "product" : "product-a",
                  "quantity" : 100,
                  "county" : "county-a"
              }]
      }', :headers => headers
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:created)
      body = JSON.parse(response.body)
      expect(body["sold_price"]).to eq(1300.0)
      expect(body["profit"]).to eq(170.0)
      expect(body["tax"]).to eq(130.0)
    end

    it "create sale errors for invalid product" do
      brand = Brand.create(:name => "Brand A")
      County.create(:name => "County A",
                    :tax => 10,
                    :mark_up => 30)
      Product.create(:name => "Product A",
                     :cost_price => 10,
                     :brand => brand)
      Product.create(:name => "Product B",
                     :cost_price => 20,
                     :brand => brand)

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/sales", :params => '{
          "items" :
              [{
                  "product" : "invalid-product",
                  "quantity" : 100,
                  "county" : "county-a"
              }]
      }', :headers => headers
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
