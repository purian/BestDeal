class AddTrafficSourceToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :traffic_source, :string
  end
end
