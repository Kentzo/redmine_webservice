require File.dirname(__FILE__) + '/../struct/user/user_dto'

class UserApi < ActionWebService::API::Base
  
  api_method :current,
    :returns => [UserDto]
    
end
