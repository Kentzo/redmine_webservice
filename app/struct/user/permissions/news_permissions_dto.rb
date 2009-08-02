class NewsPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_news, :boolean
  member :is_allow_comment_news, :boolean
  
  def self.create(project, user)
    NewsPermissionsDto.new(
      :is_allow_manage_news => user.allowed_to?(:manage_news, project),
      :is_allow_comment_news => user.allowed_to?(:comment_news, project)
    )
  end
end