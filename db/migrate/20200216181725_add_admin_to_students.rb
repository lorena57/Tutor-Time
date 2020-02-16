class AddAdminToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :admin, :boolean
  end
end
