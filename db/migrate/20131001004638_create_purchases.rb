class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :product
      t.string :price
      t.string :date

      t.timestamps
    end
  end
end
