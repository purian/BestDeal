class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :city
      t.string :name
      t.string :image
      t.string :token

      t.timestamps
    end
  end
end
