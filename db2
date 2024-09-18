users:<staff>
	id
	name
	lastname
	nat_id
	passowrd
	mail
	position
	access
		mod1
			read/write
			
	permission:
		branch
			id-1
				read/write
		step
			id-1
				read/write
		grade
			id-1
				read/write
		
	enabled
	

modules
	id
	name
	description

logs
	id
	user_id
	branch_id
	timestamp
	target
	action [Create-Update-Delete]
	detail 

Branches
	id
	city
	branch_name
	address
	description

steps_dore
	id
	branch_id
	step_name

grades_payeh:
	id
	step_id
	grade_name

study_period
	id
	grade_id
	period
	
classes
	id
	period_id
	class_name
	
courses:
	id
	class_id
	course_name
	
gradeless_courses
	id
	step_id
	class_name
	period
	description
	
teachers
	id
	name
	lastname
	email
	telephone
	nat_id
	password
	enabled
	
teacher_detail
	id
	teacher_id
	degree
	field
	employed_at
	branch_id
	quit_at
	
teacher_course
	id
	teacher_detail_id
	course_id
	gradeless_course_id	
	
students
	id
	name
	lastname
	father_name
	gender
	nat_id
	password
	birthday
	enabled

parents:
	id
	student_id
	name
	lastname
	relationship
	nat_id
	password
	telephone
	enabled
	
student_detail
	id
	student_id
	study_class_id	
		
student_course
	id
	student_id
	course_id
	gradeless_course_id
	teacher_course_id

evaluations:
	id
	course_id
	gradeless_course_id
	eval_name
	maximum_grade
	date
	
student_evaluations
	id
	eval_id
	student_id
	grade
	
	
	
	
	
	
