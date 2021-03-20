class Sale < ApplicationRecord

  has_many :items

  before_save :save_items, :set_sold_price, :set_tax, :set_profit

  def save_items
    self.items.each(&:save!)
  end

  def set_sold_price
    self.sold_price = items.pluck(:price).sum
  end

  def set_tax
    self.tax = items.pluck(:tax).sum
  end

  def set_profit
    self.profit = sold_price - (tax + items.map(&:cost_price).sum)
  end
end
