class College < ApplicationRecord
	has_many :students

	def self.search(search)
		if search
			where(["name LIKE ?", "%#{search}%"])
		else
			all
		end
	end
end
