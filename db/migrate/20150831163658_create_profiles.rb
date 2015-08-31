class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text   :summary
      t.text   :comments
      t.string :website
      t.string :linkedin
      t.string :github
      t.string :availability
      t.string :desired_salary
      t.string :desired_hourly

      t.timestamps null: false
    end
  end
end
