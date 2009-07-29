require File.dirname(__FILE__) + '/permissions/issue_permissions_dto'
require File.dirname(__FILE__) + '/permissions/project_permissions_dto'

class RoleDto < ActionWebService::Struct
  member :project_identifier, :string
  member :project_permissions, ProjectPermissionsDto
  member :issue_permissions, IssuePermissionsDto
  
  def self.create(project, user)
    RoleDto.new(
      :project_identifier => project.identifier,
      :project_permissions => ProjectPermissionsDto.create(project, user),
      :issue_permissions => IssuePermissionsDto.create(project, user)
    )
  end
end