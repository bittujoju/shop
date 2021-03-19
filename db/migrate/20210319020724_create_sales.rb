class CreateSales < ActiveRecord::Migration[5.1]
  def self.up
    create_table :sales do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
