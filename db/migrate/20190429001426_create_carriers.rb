class CreateCarriers < ActiveRecord::Migration[5.2]
  def change
    create_table :carriers do |t|
      t.string :company_name
      t.string :company_address_1
      t.string :company_address_2, :null => true
      t.string :company_city
      t.string :company_state
      t.string :company_zip
    end
  end
end
