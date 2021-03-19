class CreateSales < ActiveRecord::Migration[5.1]
  def self.up
    create_table :sales do |t|
      t.float      :sold_price
      t.float      :tax
      t.float      :profit

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
