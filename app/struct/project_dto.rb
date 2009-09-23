require File.dirname(__FILE__) + '/tracker_dto'

class ProjectDto < ActionWebService::Struct
#          <id xsi:type="xsd:int">1</id>
#          <name xsi:type="xsd:string">Redmine Mylyn Webservice</name>
#          <description xsi:type="xsd:string"></description>
#          <homepage xsi:type="xsd:string"></homepage>
#          <is_public xsi:type="xsd:boolean">true</is_public>
#          <parent_id xsi:nil="true"></parent_id>
#          <projects_count xsi:type="xsd:int">0</projects_count>
#          <created_on xsi:type="xsd:dateTime">2008-05-13T19:40:41+02:00</created_on>
#          <updated_on xsi:type="xsd:dateTime">2008-05-24T15:02:28+02:00</updated_on>
#          <identifier xsi:type="xsd:string">redmine-mylyn</identifier>
#          <status xsi:type="xsd:int">1</status>

  member :id, :int
  member :identifier, :string
  member :name, :string
  member :description, :string
  member :role_id, :int #will empty if user is the 'admin'
  member :trackers_ids, [:int]
  member :issue_categories_ids, [:int]
  member :members_ids, [:int]
  
  def self.create(project, user)
    #collect trackers ids
    trackers = project.trackers.find(:all)
    trackers.collect! {|x| x.id}
    trackers.sort!
    #collect members ids
    members = project.members.find(:all)
    members.collect! {|x| x.id}
    members.sort!

    member = project.members.find(:first, :conditions => ["user_id = :userid", {:userid => user.id}])
    role_id = nil
    if !user.admin?
      if member
        role_id = member.role.id
      elsif
        role_id = 1
      end
    end
    
    issue_categories = project.issue_categories
    issue_categories.collect! { |category| category.id }
    issue_categories.sort!
    
    ProjectDto.new(
      :id => project.id,
      :identifier => project.identifier,
      :name => project.name,
      :description => project.short_description
      :trackers_ids => trackers,
      :role_id => role_id,
      :issue_categories_ids => issue_categories,
      :members_ids => members
    )
  end
  
  /def self.createAndReturn(project,boo_saved,boo_new) 
  	return ProjectDto.new(
      :id => project.id,
      :identifier => project.identifier,
      :name => project.name,
      :issue_edit_allowed => User.current.allowed_to?(:edit_issues, project),
      :project_saved => boo_saved,
      :new_project => boo_new
      )
  end/
end
