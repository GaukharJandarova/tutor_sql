class LearnUsers < ActiveRecord::Migration
  def change
    create_table :learnusers do |t|
      t.integer  :user_id
      t.string  :user_name
      t.timestamps null: false
    end
  end
end
