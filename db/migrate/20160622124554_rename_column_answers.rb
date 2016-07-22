class RenameColumnAnswers < ActiveRecord::Migration
  def change
    change_table :Answers do |t|
      t.rename :challende_id, :challenge_id
    end
  end
end
