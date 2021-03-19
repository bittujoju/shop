class Item < ActiveRecord::Base

  belongs_to :product
  belongs_to :county
  belongs_to :sale

  def name
    self.product.name
  end

end
