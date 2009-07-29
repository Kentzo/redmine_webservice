#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../api/role_api'
require File.dirname(__FILE__) + '/../struct/role_dto'

class RoleService < ActionWebService::Base
  
  web_service_api RoleApi

  def get_current_user_roles
    roles = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    roles.collect! {|x| RoleDto.create(x, User.current)}
  end
end
