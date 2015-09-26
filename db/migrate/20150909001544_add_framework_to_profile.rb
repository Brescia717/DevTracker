class AddFrameworkToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :framework, :string
  end
end
