require File.dirname(__FILE__) + '/../struct/user/user_dto'

class UserApi < ActionWebService::API::Base
  
#getter methods
  api_method :current,
    :returns => [UserDto]
end
