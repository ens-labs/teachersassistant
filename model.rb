require 'bcrypt'
require 'data_mapper'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial, key: true
  property :username, String, length: 128
  property :name, String, length: 128
  property :last_name, String, length: 128
  property :school, String, length: 128

  property :password, BCryptHash

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end
end

class Student
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String, length: 30
  property :last_name, String, length: 30
  property :grade_group, String, length: 10

  property :parents_name, String, length: 30
  property :parents_number, String, length: 20
end

# Tell DataMapper the models are done being defined
DataMapper.finalize

# Update the database to match the properties of the models.
DataMapper.auto_upgrade!
