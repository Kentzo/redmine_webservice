class IssuePermissionsDto < ActionWebService::Struct
  member :is_allow_manage_issue_categories, :boolean
  member :is_allow_manage_issue_relations, :boolean
  member :is_allow_edit_own_notes, :boolean
  member :is_allow_manage_public_queries, :boolean
  member :is_allow_view_calender, :boolean
  member :is_allow_add_issues, :boolean
  member :is_allow_add_notes, :boolean
  member :is_allow_move_issues, :boolean
  member :is_allow_save_queries, :boolean
  member :is_allow_view_watchers_list, :boolean
  member :is_allow_edit_issues, :boolean
  member :is_allow_edit_notes, :boolean
  member :is_allow_delete_issues, :boolean
  member :is_allow_view_gantt_chart, :boolean
  member :is_allow_add_watchers, :boolean
  
  def self.create(project, user)
    IssuePermissionsDto.new(
      :is_allow_manage_issue_categories => user.allowed_to?(:manage_issue_categories, project),
      :is_allow_manage_issue_relations => user.allowed_to?(:manage_issue_relations, project),
      :is_allow_edit_own_notes => user.allowed_to?(:edit_own_notes , project),
      :is_allow_manage_public_queries => user.allowed_to?(:manage_public_queries, project),
      :is_allow_view_calender => user.allowed_to?(:view_calender, project),
      :is_allow_add_issues => user.allowed_to?(:add_issues, project),
      :is_allow_add_notes => user.allowed_to?(:add_notes, project),
      :is_allow_move_issues => user.allowed_to?(:move_issues, project),
      :is_allow_save_queries => user.allowed_to?(:save_queries, project),
      :is_allow_view_watchers_list => user.allowed_to?(:view_watchers_list, project),
      :is_allow_edit_issues => user.allowed_to?(:edit_issues, project),
      :is_allow_edit_notes => user.allowed_to?(:edit_notes, project),
      :is_allow_delete_issues => user.allowed_to?(:delete_issues, project),
      :is_allow_view_gantt_chart => user.allowed_to?(:view_gantt_chart, project),
      :is_allow_add_watchers => user.allowed_to?(:add_watchers, project)
    )
  end
end