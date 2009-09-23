class DocumentsPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_documents, :boolean
  member :is_allow_view_documents, :boolean
  
  def self.create(project, user)
    DocumentsPermissionsDto.new(
      :is_allow_manage_documents => user.allowed_to?(:manage_documents, project),
      :is_allow_view_documents => user.allowed_to?(:view_documents, project)
    )
  end
end