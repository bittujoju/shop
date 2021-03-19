class CreateItems < ActiveRecord::Migration[5.1]
  def self.up
    create_table :items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :county, index: true
      t.belongs_to :sale, index: true
      t.float      :price
      t.integer    :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
