class AddLevelToEnrolls < ActiveRecord::Migration
  def change
    add_column :enrolls, :chapter_level, :integer
  end
end
