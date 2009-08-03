#require File.dirname(__FILE__) + '/../struct/user/user_dto'
require File.dirname(__FILE__) + '/../struct/role_dto'
require File.dirname(__FILE__) + '/../struct/tracker_dto'

class UserApi < ActionWebService::API::Base
  
  #api_method :current,
  #  :returns => [UserDto]
    
  api_method :available_roles,
    :returns => [[RoleDto]]
    
  api_method :available_trackers,
    :returns => [[TrackerDto]]
end
