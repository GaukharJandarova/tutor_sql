class AddLevelToChellenges < ActiveRecord::Migration
  def change
    add_column :challenges, :challenge_level, :integer
  end
end
