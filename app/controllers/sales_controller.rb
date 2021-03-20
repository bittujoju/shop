class SalesController < ApplicationController

  def create
    items = []

    begin
      params["items"].each do |item|
        product = Product.find_by_slug(item["product"])
        county = County.find_by_slug(item["county"])
        quantity = item["quantity"].to_i

        raise "Invalid Product" unless product.present?
        raise "Invalid County" unless county.present?
        raise "Invalid Quantity" unless quantity.present?

        new_item = Item.new({
                     product: product,
                     county: county,
                     quantity: item["quantity"],
                 })

        items.push(new_item)
      end

      sale = Sale.create({items: items})
    rescue Exception => e
      Rails.logger.error("Error while saving Sale : #{e.message}")
    else
      Rails.logger.info("New Sale created with id : #{sale.id}")
      render json: sale.to_json
    end
  end
end
