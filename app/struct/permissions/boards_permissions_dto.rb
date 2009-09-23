class BoardsPermissionsDto < ActionWebService::Struct
  member :is_allow_manage_boards, :boolean
  member :is_allow_edit_own_messages, :boolean
  member :is_allow_post_messages, :boolean
  member :is_allow_delete_messages, :boolean
  member :is_allow_edit_messages, :boolean
  member :is_allow_delete_own_messages, :boolean
  
  def self.create(project, user)
    BoardsPermissionsDto.new(
      :is_allow_manage_boards => user.allowed_to?(:manage_boards, project),
      :is_allow_edit_own_messages => user.allowed_to?(:edit_own_messages, project),
      :is_allow_post_messages => user.allowed_to?(:add_messages, project),
      :is_allow_delete_messages => user.allowed_to?(:delete_messages, project),
      :is_allow_edit_messages => user.allowed_to?(:edit_messages, project),
      :is_allow_delete_own_messages => user.allowed_to?(:delete_own_messages, project)
    )
  end
end