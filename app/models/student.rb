class Student < ApplicationRecord
	belongs_to :college, foreign_key: "college_id"
	COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']

	def self.group_by_input_value(students, group_by_value)
	  students.group_by { |student| student[group_by_value] }
	end
	
	def self.sort_by_input_value(students, sort_by_subject)
	  students.each do |key, value|
	    students[key] = value.sort_by { |subject| subject[sort_by_subject] }
	  end
	end

	def self.compute (params,total_marks,change_marks,students, dis_arr)
		students = Student.all

		student_group_values = self.group_by_input_value(students, params[:input_group_by])
		student_sort_values = self.sort_by_input_value(student_group_values, params[:input_sort_by])
   	end
end
 