class RepositoryPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_repository, :boolean
  member :is_allow_browse_repository, :boolean
  member :is_allow_commit_access, :boolean
  member :is_allow_view_changesets, :boolean
  
  def self.create(project, user)
    RepositoryPermissionsDto.new(
      :is_allow_manage_repository => user.allowed_to?(:manage_repository, project),
      :is_allow_browse_repository => user.allowed_to?(:browse_repository, project),
      :is_allow_commit_access => user.allowed_to?(:commit_access, project),
      :is_allow_view_changesets => user.allowed_to?(:view_changesets, project)
    )
  end
end