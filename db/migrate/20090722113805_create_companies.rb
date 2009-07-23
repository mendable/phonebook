class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
