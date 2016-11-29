class Student < ApplicationRecord
	belongs_to :college, foreign_key: "college_id"
end
