class CreateProducts < ActiveRecord::Migration[5.1]
  def self.up
    create_table :products do |t|
      t.string    :name
      t.string    :slug
      t.float     :cost_price
      t.belongs_to :brand, index: true

      t.timestamps
    end

    add_index :products, [:slug]
  end

  def self.down
    drop_table :products
  end
end
