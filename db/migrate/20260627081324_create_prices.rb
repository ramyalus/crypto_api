class CreatePrices < ActiveRecord::Migration[7.2]
  def change
    create_table :prices do |t|
      t.string :symbol
      t.decimal :value
      t.datetime :fetched_at

      t.timestamps
    end
  end
end
