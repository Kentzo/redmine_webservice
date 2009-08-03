class WikiPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_wiki, :boolean
  member :is_allow_view_wiki, :boolean
  member :is_allow_delete_attachments, :boolean
  member :is_allow_rename_wiki_pages, :boolean
  member :is_allow_view_wiki_history, :boolean
  member :is_allow_protect_wiki_pages, :boolean
  member :is_allow_delete_wiki_pages, :boolean
  member :is_allow_edit_wiki_pages, :boolean
  
  def self.create(project, user)
    WikiPermissionsDto.new(
      :is_allow_manage_wiki => user.allowed_to?(:manage_wiki, project),
      :is_allow_view_wiki => user.allowed_to?(:view_wiki_pages, project),
      :is_allow_delete_attachments => user.allowed_to?(:delete_wiki_pages_attachments, project),
      :is_allow_rename_wiki_pages => user.allowed_to?(:rename_wiki_pages, project),
      :is_allow_view_wiki_history => user.allowed_to?(:view_wiki_edits, project),
      :is_allow_protect_wiki_pages => user.allowed_to?(:protect_wiki_pages, project),
      :is_allow_delete_wiki_pages => user.allowed_to?(:delete_wiki_pages, project),
      :is_allow_edit_wiki_pages => user.allowed_to?(:edit_wiki_pages, project)
    )
  end
end