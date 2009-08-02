class FilesPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_files, :boolean
  member :is_allow_view_files, :boolean
  
  def self.create(project, user)
    FilesPermissionsDto.new(
      :is_allow_manage_files => user.allowed_to?(:manage_files, project),
      :is_allow_view_files => user.allowed_to?(:view_files, project)
    )
  end
end