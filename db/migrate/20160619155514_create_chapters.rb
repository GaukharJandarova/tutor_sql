class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer  :course_id
      t.string   :title
      t.text     :content
      t.timestamps null: false
    end
  end
end
