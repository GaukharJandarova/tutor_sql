class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer  :challende_id
      t.text     :answer_text
      t.boolean  :is_correctly
      t.integer  :user_id
      t.timestamps null: false
    end
  end
end
