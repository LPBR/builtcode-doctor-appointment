class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :crm, limit: 10
      t.string :crm_uf, limit: 2
      t.timestamps
    end
  end
end
