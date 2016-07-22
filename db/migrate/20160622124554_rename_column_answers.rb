class RenameColumnAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.rename :challende_id, :challenge_id
    end
  end
end
