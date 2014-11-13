class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :ip
      t.integer :offer_id

      t.timestamps
    end
  end
end
