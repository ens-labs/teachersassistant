require 'data_mapper'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

require './model'

class StudentController
	def new(name, last_name, grade_group)
		@student = Student.new(:name => "#{name}", :last_name => "#{last_name}", :grade_group => "#{grade_group}")
		@student.save!
	end

	# def delete()

	# end
end