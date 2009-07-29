require File.dirname(__FILE__) + '/permissions/issue_permissions_dto'
require File.dirname(__FILE__) + '/permissions/project_permissions_dto'

class RoleDto < ActionWebService::Struct
  member :role, :string
  member :project_id, :int
  member :project_permissions, ProjectPermissionsDto
  member :issue_permissions, IssuePermissionsDto
  
  def self.create(project, user)
    member = project.members.find(:first, :conditions => ["user_id = :userid", {:userid => user.id}])
    name = nil
    
    if member
      name = member.role.name
    elsif user.admin?
      name = 'Admin'
    else
      name = 'Not a member'
    end
    
    RoleDto.new(
      :role => name,
      :project_id => project.id,
      :project_permissions => ProjectPermissionsDto.create(project, user),
      :issue_permissions => IssuePermissionsDto.create(project, user)
    )
  end
end