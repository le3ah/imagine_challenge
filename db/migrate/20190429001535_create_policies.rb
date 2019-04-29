class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.references :carrier, foreign_key: true, :null => true
      t.references :client, foreign_key: true, :null => true
      t.string :policy_type, :null => true
      t.string :division, :null => true
      t.string :effective_date, :null => true
      t.string :expiration_date, :null => true
      t.string :written_premium, :null => true
      t.string :carrier_policy_number, :null => true
    end
  end
end
