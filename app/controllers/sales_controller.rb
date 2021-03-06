class SalesController < ApplicationController

  def create
    items = []

    begin
      sale_params["items"].each do |item|
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
      render json: {message: "Internal Server Error : #{e.message}"}, status: 500
    else
      Rails.logger.info("New Sale created with id : #{sale.id}")
      render json: sale.to_json, status: 201
    end
  end

  private

  def sale_params
    params.permit(items: [:product, :quantity, :county])
  end
end
