require File.dirname(__FILE__) + '/../struct/user_dto'
require File.dirname(__FILE__) + '/../struct/role_dto'
require File.dirname(__FILE__) + '/../struct/tracker_dto'
require File.dirname(__FILE__) + '/../struct/issue_category_dto'

class UserApi < ActionWebService::API::Base
  
  api_method :current,
    :returns => [UserDto]
    
  api_method :available_roles,
    :returns => [[RoleDto]]
    
  api_method :available_trackers,
    :returns => [[TrackerDto]]
  
  api_method :available_issue_categories,
    :returns => [[IssueCategoryDto]]
    
end
