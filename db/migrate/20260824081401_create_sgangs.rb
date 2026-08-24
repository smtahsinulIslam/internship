class CreateSgangs < ActiveRecord::Migration[8.1]
  def change
    create_table :sgangs do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :facebook

      t.timestamps
    end
  end
end
