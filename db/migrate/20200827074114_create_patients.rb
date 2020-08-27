class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_date
      t.string :cpf, limit: 11
      t.references :doctor, foreign_key: true, index: true
      t.timestamps
    end
  end
end
