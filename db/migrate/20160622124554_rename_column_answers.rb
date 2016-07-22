class RenameColumnAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :challende_id, :challenge_id
  end
end
