class Item < ApplicationRecord

  belongs_to :product
  belongs_to :county
  belongs_to :sale

  validates_presence_of   :quantity, :message => "quantity Required"
  before_save :set_selling_price, :set_tax

  def name
    self.product.name
  end

  def cost_price
    self.product.cost_price * quantity
  end

  def set_selling_price
    self.price = self.cost_price * (1 + (county.mark_up/100))
  end

  def set_tax
    self.tax = (price * county.tax/100)
  end

end
