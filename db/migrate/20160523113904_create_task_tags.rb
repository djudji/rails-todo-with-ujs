class CreateTaskTags < ActiveRecord::Migration[5.0]
  def change
    create_table :task_tags do |t|

      t.timestamps
    end
  end
end
