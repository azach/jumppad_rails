class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :position
      t.references :trip, :null => false

      t.timestamps
    end
  end
end
