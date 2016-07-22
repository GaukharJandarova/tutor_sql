class CreateChallendes < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer  :chapter_id
      t.string   :title
      t.text     :content
      t.text     :correct_result
      t.timestamps null: false
    end
  end
end
