json.extract! student, :id, :student_id, :department, :maths, :physics, :chemistry, :year, :created_at, :updated_at
json.url student_url(student, format: :json)