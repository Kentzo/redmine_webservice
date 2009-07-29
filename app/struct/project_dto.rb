require File.dirname(__FILE__) + '/tracker_dto'
require File.dirname(__FILE__) + '/version_dto'

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
  member :trackers, [:int]
  
  def self.create(project)
    trackers = project.trackers.find(:all);
    trackers.collect! {|x| x.id}
    
    ProjectDto.new(
      :id => project.id,
      :identifier => project.identifier,
      :name => project.name,
      :trackers => trackers
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