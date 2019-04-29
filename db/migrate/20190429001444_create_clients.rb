class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, :null => true
      t.string :address, :null => true
      t.string :city, :null => true
      t.string :state, :null => true
      t.string :division, :null => true
      t.string :major_group, :null => true
      t.string :industry_group, :null => true
      t.string :sic, :null => true
      t.string :description, :null => true

      t.timestamps
    end
  end
end
