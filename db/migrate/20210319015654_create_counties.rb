class CreateCounties < ActiveRecord::Migration[5.1]
  def self.up
    create_table :counties do |t|
      t.string    :name
      t.string    :slug
      t.float     :mark_up
      t.float     :tax

      t.timestamps
    end

    add_index :counties, [:slug]
  end

  def self.down
    drop_table :counties
  end
end
