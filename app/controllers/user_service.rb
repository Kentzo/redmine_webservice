#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../api/user_api'
#require File.dirname(__FILE__) + '/../struct/user/user_dto'
require File.dirname(__FILE__) + '/../struct/role_dto'
require File.dirname(__FILE__) + '/../struct/tracker_dto'

class UserService < ActionWebService::Base

  web_service_api UserApi
  
  /def current 
    UserDto.create(User.current)
  end/
  
  def available_roles #if user is admin then method will returns one RoleDto without id but with name = 'Admin'. Also roles with name 'Non a member' don't have an id
    tmp = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    tmp.collect! {|x| RoleDto.create(x, User.current)}
    tmp.uniq!
    return tmp
  end
  
  def available_trackers
    tmp = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    trackers = []
    tmp.each{ |project|
      tmp_trackers = project.trackers.find(:all)
      tmp_trackers.collect! {|x| TrackerDto.create(x)}
      trackers.concat(tmp_trackers)
    }
    trackers.uniq!
    return trackers
  end
end
