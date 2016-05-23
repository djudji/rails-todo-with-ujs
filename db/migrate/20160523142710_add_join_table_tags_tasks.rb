class AddJoinTableTagsTasks < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Tags, :Tasks do |t|
      t.index [:tag_id, :task_id]
      t.index [:task_id, :tag_id]
    end
  end
end
