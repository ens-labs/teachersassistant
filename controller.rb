require 'data_mapper'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

require './model'

class StudentController
	def create(name, last_name, grade_group)
		@student = Student.new(:name => "#{name}", :last_name => "#{last_name}", :grade_group => "#{grade_group}")
		@student.save!
	end

	def show()
		return Student.all
	end
end

class UserController
	def signup(name, last_name, school, username, password)
		@user = User.new(:name => "#{name}", :last_name => "#{last_name}", :school => "#{school}", :username => "#{username}", :password => "#{password}")
		@user.save!
	end
end