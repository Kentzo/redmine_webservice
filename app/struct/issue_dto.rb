#require File.dirname(__FILE__) + '/custom_value_dto'
#require File.dirname(__FILE__) + '/issue_status_dto'
#require File.dirname(__FILE__) + '/journal_dto'
#require File.dirname(__FILE__) + '/attachment_dto'
#require File.dirname(__FILE__) + '/issue_relation_dto'

class IssueDto < ActionWebService::Struct
#:category, :status, :priority, :fixed_version, :start_date,  :estimated_hours
#information for view
  member :id, :int
  member :subject, :string
  member :description, :string
  member :author, :string
  member :assigned_to, :string
  member :status_id, :int #use with StatusApi::get_all method
  member :priority, :string
  member :category, :string
  member :tracker, :int #use with TrackerApi::get_all method
   
  member :created_on, :datetime
  member :updated_on, :datetime
  member :due_date, :datetime

  member :spent_hours, :double
  member :done_ratio, :int
  member :estimated_hours, :double
#other
  #float
  #member :status_id, :int
  #member :category_id, :int
  #member :version_id, :int
  #member :tracker_id, :int
  #member :priority_id, :int
  #member :assigned_to_id, :int
  #member :project_id, :int
  #member :project_name, :string
  #member :custom_values, [CustomValueDto]
  #member :all_status, [IssueStatusDto]
  #member :all_journals, [JournalDto]
  #member :all_attachments, [AttachmentDto]
  #member :all_relations, [IssueRelationDto]
  
  def self.create issue
    #custom_values = issue.custom_values
    #custom_values.collect! { |x| CustomValueDto.create(x)}
    #custom_values.compact!
    
    return IssueDto.new(
      :id => issue.id,
      :subject => issue.subject,
      :description => issue.description,
      :author => issue.author.name,
      :assigned_to => issue.assigned_to,
      :status_id => issue.status.id,
      :priority => issue.priority,
      :category => issue.category,
      :tracker_id => issue.tracker_id,  
      
      :created_on => issue.created_on,
      :updated_on => issue.updated_on,
      :due_date => issue.due_date,
      
      :spent_hours => issue.spent_hours,
      :done_ratio => issue.done_ratio,
      :estimated_hours => issue.estimated_hours
      #:project_id => issue.project_id,
      #:project_name => "",
      #:assigned_to_id => issue.assigned_to_id,
      #:priority_id => issue.priority_id,
      #:category_id => issue.category_id,
      #:version_id => issue.fixed_version_id,
      #:tracker_id => issue.tracker_id,
      #:status_id => issue.status_id,
      #:custom_values => custom_values
    )
#    rescue
#      nil
  end
end
