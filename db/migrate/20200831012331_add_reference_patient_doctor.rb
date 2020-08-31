class AddReferencePatientDoctor < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :doctor, index: true, foreign_key: true
  end
end
