class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.integer :years_exp
      t.string :SME
      t.timestamps
    end
  end
end
