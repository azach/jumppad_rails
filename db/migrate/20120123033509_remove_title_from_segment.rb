class RemoveTitleFromSegment < ActiveRecord::Migration
  def up
    remove_column :segments, :title
      end

  def down
    add_column :segments, :title, :string
  end
end
