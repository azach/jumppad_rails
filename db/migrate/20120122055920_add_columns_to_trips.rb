class AddColumnsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :description, :string

		add_column :trips, :title, :string

    add_column :trips, :start_date, :datetime

    add_column :trips, :end_date, :datetime

  end
end
