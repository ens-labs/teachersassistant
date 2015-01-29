require 'data_mapper'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

require './model'

class StudentController
	def create(name, last_name, grade_group)
		if name == nil
			#handle the exceptions
			puts "name is nil"
		elsif last_name == nil
			puts "last_name is nil"
		elsif grade_group == nil
			puts "grade_group is nil"
		elsif name == nil && last_name == nil && grade_group == nil
			puts "Idk what happened"
		else
			@student = Student.new(:name => "#{name}", :last_name => "#{last_name}", :grade_group => "#{grade_group}")
			@student.save!
		end 
	end

	def show()
		return Student.all
	end
end

class UserController
	def signup(name, last_name, school, username, password)
		if User.new.find{|u| u.username == "#{username}"}
			redirect '/'
		else
			@pwd = password.gsub(/\s+/, "")
			@user = User.new(:name => "#{name}", :last_name => "#{last_name}", :school => "#{school}", :username => "#{username}", :password => @pwd)
			@user.save!
		end
	end
end