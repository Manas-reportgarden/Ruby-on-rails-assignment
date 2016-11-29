class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.text :name
      t.integer :established_year

      t.timestamps
    end
  end
end
