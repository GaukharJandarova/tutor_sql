class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :title
      t.string  :description
      ## course creator 
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
