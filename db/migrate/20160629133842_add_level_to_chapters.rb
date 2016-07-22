class AddLevelToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :chapter_level, :integer
  end
end
