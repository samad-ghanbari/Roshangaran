users:<staff>
	id
	name
	lastname
	nat_id
	passowrd
	mail
	position
	roles
		mod1
			read
			write
		mod2
			read
			write
	enabled
	

modules
	id
	name
	description

students
	id
	name
	lastname
	nat_id
	father_name
	birthday
	password
	parents:
		id
		relation
		name
		lastname
		nat_id
		password
		telephone

teachers
	id
	name
	lastname
	nat_id
	telephone
	field
	year
	enabled
	courses
		id
		course_id

courses
	id
	course 
	study_period
		
step
	id
	stage
	period
	students
		
