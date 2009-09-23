require File.dirname(__FILE__) + '/role_dto'

class UserDto < ActionWebService::Struct
  member :id, :int
  member :name, :string
  
  def self.create(user)
    UserDto.new(
      :id => user.id,
      :name => user.name
    )
  end
end