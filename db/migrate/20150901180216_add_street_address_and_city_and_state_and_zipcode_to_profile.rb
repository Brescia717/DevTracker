class AddStreetAddressAndCityAndStateAndZipcodeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :street_address, :string
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :zip_code, :string
  end
end
