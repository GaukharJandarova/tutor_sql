class AddStatusToEnrolls < ActiveRecord::Migration
  def change
    add_column :enrolls, :status, :string
  end
end
