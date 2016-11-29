class AddExtendedSidToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :extended_sid, :text
  end
end
