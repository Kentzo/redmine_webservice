class TimeTrackingPermissionsDto < ActionWebService::Struct
  member :is_allow_log_spent_time, :boolean
  member :is_allow_view_spent_time, :boolean
  member :is_allow_edit_time_logs, :boolean
  member :is_allow_edit_own_time_logs, :boolean
  
  def self.create(project, user)
    TimeTrackingPermissionsDto.new(
      :is_allow_log_spent_time => user.allowed_to?(:log_time, project),
      :is_allow_view_spent_time => user.allowed_to?(:view_time_entries, project),
      :is_allow_edit_time_logs => user.allowed_to?(:edit_time_entries, project),
      :is_allow_edit_own_time_logs => user.allowed_to?(:edit_own_time_entries, project)
    )
  end
end