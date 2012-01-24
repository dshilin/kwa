class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.column :text,           :text
      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
