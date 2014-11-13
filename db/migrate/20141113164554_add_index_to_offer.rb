class AddIndexToOffer < ActiveRecord::Migration
  def change
    add_index :offers, :token, unique: true
  end
end
