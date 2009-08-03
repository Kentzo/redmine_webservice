require File.dirname(__FILE__) + '/../role_dto'

class UserDto < ActionWebService::Struct
  member :roles, [RoleDto]
  member :name, :string
  
  def self.create(user)
    tmp = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    tmp.collect! {|x| RoleDto.create(x, user)}
    UserDto.new(
      :roles => tmp,
      :name => user.name
    )
  end
end