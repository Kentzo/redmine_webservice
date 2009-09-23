class ProjectPermissionsDto < ActionWebService::Struct
  member :is_allow_edit_project, :boolean
  member :is_allow_select_project_modules, :boolean
  member :is_allow_manage_members, :boolean
  member :is_allow_manage_versions, :boolean
  
  def self.create(project, user)
    ProjectPermissionsDto.new(
      :is_allow_edit_project => user.allowed_to?(:manage_versions, project),
      :is_allow_select_project_modules => user.allowed_to?(:select_project_modules, project),
      :is_allow_manage_members => user.allowed_to?(:manage_members, project),
      :is_allow_manage_versions => user.allowed_to?(:manage_versions, project)
    )
  end
end