class RemovePatienceDoctorReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :patients, :doctor, foreign_key: true, index: true
  end
end
