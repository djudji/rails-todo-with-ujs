class Task < ApplicationRecord
	#has_many :task_tags
	#has_many :tags, :through => :task_tags
		belongs_to :user
		has_and_belongs_to_many :tags
end
