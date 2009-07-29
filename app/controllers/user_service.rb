#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../api/user_api'
require File.dirname(__FILE__) + '/../struct/user/user_dto'

class UserService < ActionWebService::Base

  web_service_api UserApi
  
  def current 
    UserDto.create(User.current)
  end
end
