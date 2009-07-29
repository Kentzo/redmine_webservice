require File.dirname(__FILE__) + '/../struct/role_dto'

class RoleApi < ActionWebService::API::Base  
  api_method :get_current_user_roles,
    :returns => [[RoleDto]]
end
