require File.dirname(__FILE__) + '/permissions/issue_permissions_dto'
require File.dirname(__FILE__) + '/permissions/project_permissions_dto'
require File.dirname(__FILE__) + '/permissions/boards_permissions_dto'
require File.dirname(__FILE__) + '/permissions/documents_permissions_dto'
require File.dirname(__FILE__) + '/permissions/files_permissions_dto'
require File.dirname(__FILE__) + '/permissions/news_permissions_dto'
require File.dirname(__FILE__) + '/permissions/repository_permissions_dto'
require File.dirname(__FILE__) + '/permissions/time_tracking_permissions_dto'
require File.dirname(__FILE__) + '/permissions/wiki_permissions_dto'

class RoleDto < ActionWebService::Struct
  member :role, :string
  member :project_id, :int
  member :project_permissions, ProjectPermissionsDto
  member :issue_permissions, IssuePermissionsDto
  member :boards_permissions, BoardsPermissionsDto
  member :documents_permissions, DocumentsPermissionsDto
  member :files_permissions, FilesPermissionsDto
  member :news_permissions, NewsPermissionsDto
  member :repository_permissions, RepositoryPermissionsDto
  member :time_tracking_permissions, TimeTrackingPermissionsDto
  member :wiki_permissions, WikiPermissionsDto
  
  def self.create(project, user)
    member = project.members.find(:first, :conditions => ["user_id = :userid", {:userid => user.id}])
    name = nil
    
    if member
      name = member.role.name
    elsif user.admin?
      name = 'Admin'
    else
      name = 'Non a member'
    end
    
    RoleDto.new(
      :role => name,
      :project_id => project.id,
      :project_permissions => ProjectPermissionsDto.create(project, user),
      :issue_permissions => IssuePermissionsDto.create(project, user),
      :boards_permissions => BoardsPermissionsDto.create(project, user),
      :documents_permissions => DocumentsPermissionsDto.create(project, user),
      :files_permissions => FilesPermissionsDto.create(project, user),
      :news_permissions => NewsPermissionsDto.create(project, user),
      :repository_permissions => RepositoryPermissionsDto.create(project, user),
      :time_tracking_permissions => TimeTrackingPermissionsDto.create(project, user),
      :wiki_permissions => WikiPermissionsDto.create(project, user)
    )
  end
end