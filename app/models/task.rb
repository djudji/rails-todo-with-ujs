class Task < ApplicationRecord
	
	belongs_to :user
	has_and_belongs_to_many :tags

	scope :important, -> { where(important: true) }
	scope :starred, -> { where(starred: true) }
	scope :finished, -> { where(finished: true) }
	scope :scheduled, -> { where.not(due_date: nil) }
	scope :today, -> { where(due_date: "#{Date.today.to_time(:utc)}") }

	def all_tags=(names)
		self.tags = names.split(",").map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
		Tag.find_by_name!(name).tasks
	end
		
end
