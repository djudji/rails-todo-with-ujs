class AddActionsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :important, :boolean
    add_column :tasks, :starred, :boolean
  end
end
