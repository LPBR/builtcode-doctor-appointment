class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :patient, foreign_key: true, index: true
      t.references :doctor, foreign_key: true, index: true

      t.timestamps
    end
  end
end
