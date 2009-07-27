#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../struct/tracker_dto'
require File.dirname(__FILE__) + '/../struct/issue_category_dto'
require File.dirname(__FILE__) + '/../struct/member_dto'
require File.dirname(__FILE__) + '/../struct/version_dto'
require File.dirname(__FILE__) + '/../struct/issue_status_dto'
require File.dirname(__FILE__) + '/../struct/issue_custom_field_dto'
require File.dirname(__FILE__) + '/../struct/query_dto'

class ProjectBasedApi < ActionWebService::API::Base

  #getter methods
  api_method :get_trackers_for_project,
    :expects => [:string],
    :returns => [[TrackerDto]]
  
  api_method :get_issue_categorys_for_project,
    :expects => [:string],
    :returns => [[IssueCategoryDto]]

  api_method :get_issue_custom_fields_for_project,
    :expects => [:string],
    :returns => [[IssueCustomFieldDto]]

  api_method :get_members_for_project,
    :expects => [:string],
    :returns => [[MemberDto]]

  api_method :get_versions_for_project,
    :expects => [:string],
    :returns => [[VersionDto]]

  api_method :get_queries_for_project,
    :expects => [:string],
    :returns => [[QueryDto]]

end
