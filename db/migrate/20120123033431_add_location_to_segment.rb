class AddLocationToSegment < ActiveRecord::Migration
  def change
    add_column :segments, :location, :string

    add_column :segments, :latitude, :float

    add_column :segments, :longitude, :float

  end
end
