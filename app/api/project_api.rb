#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************
 
require File.dirname(__FILE__) + '/../struct/project_dto'
require File.dirname(__FILE__) + '/../struct/issue_dto'
require File.dirname(__FILE__) + '/../struct/boolean_dto'

class ProjectApi < ActionWebService::API::Base
  
#getter methods
  api_method :find_all,
    :returns => [[ProjectDto]]
  
  api_method :find_one_project,
    :expects => [:string],
    :returns => [ProjectDto]
    
  api_method :description_one_project,
    :expects => [:string],
    :returns => [:string]
    
  api_method :find_issues_for_project,
    :expects => [:string],
    :returns => [[IssueDto]]
    /
  api_method :create_one_project,
  	:expects => [:string, :string, :string],
    :returns => [ProjectDto]

  api_method :update_one_project,
  	:expects => [:string, :string, :string],
    :returns => [ProjectDto]    
    /

end
