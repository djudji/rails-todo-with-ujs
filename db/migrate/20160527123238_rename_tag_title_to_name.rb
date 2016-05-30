class RenameTagTitleToName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tags, :title, :name
  end
end
