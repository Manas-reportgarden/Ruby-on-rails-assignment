class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :student_id
      t.string :department
      t.integer :maths
      t.integer :physics
      t.integer :chemistry
      t.integer :year

      t.timestamps
    end
  end
end
