namespace :task do
  desc "Fill the attribute extended_sid"
  task populate: :environment do
  	student = Student.all
  	student.each do |x|
  		x.extended_sid = "#{x.student_id}_#{x.college.name.slice(0,2)}"
 		puts x.extended_sid
 		x.save!
  	end
  end

end
