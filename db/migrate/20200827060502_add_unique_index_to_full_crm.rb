class AddUniqueIndexToFullCrm < ActiveRecord::Migration[6.0]
  def change
    add_index :doctors, [:crm, :crm_uf], unique: true
  end
end
