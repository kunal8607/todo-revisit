class TodoItem< ApplicationRecord
	validates :name, presence: true
	validates :desc, presence: true
end