class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.belongs_to :student
      t.belongs_to :tutor
      t.timestamps
    end
  end
end
