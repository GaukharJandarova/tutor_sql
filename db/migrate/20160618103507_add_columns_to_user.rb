class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_flag, :boolean, default: false
    add_column :users, :tutor_flag, :boolean, default: false
  end
end
