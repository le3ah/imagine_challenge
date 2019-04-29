class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.references :carrier, foreign_key: true
      t.references :client, foreign_key: true
    end
  end
end
