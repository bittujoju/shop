class CreateBrands < ActiveRecord::Migration[5.1]
  def self.up
    create_table :brands do |t|
      t.string    :name
      t.string    :slug

      t.timestamps
    end

    add_index :brands, [:slug]
  end

  def self.down
    drop_table :brands
  end
end
