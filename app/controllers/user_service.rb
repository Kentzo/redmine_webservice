#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../api/user_api'
require File.dirname(__FILE__) + '/../struct/user_dto'
require File.dirname(__FILE__) + '/../struct/role_dto'
require File.dirname(__FILE__) + '/../struct/tracker_dto'
require File.dirname(__FILE__) + '/../struct/issue_category_dto'

class UserService < ActionWebService::Base

  web_service_api UserApi
  
  def current 
    UserDto.create(User.current)
  end
  
  def available_roles #if user is an admin then this method will return only one RoleDto object without an id, but with the name = 'Admin'.
    roles = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    roles.collect! {|x| RoleDto.create(x, User.current)}
    roles.uniq!
    roles.sort!
    return roles
  end
  
  def available_trackers
    tmp = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    #Problem: trackers in issues != trackers in projects
    trackers = []
    tmp.each{ |project|
      tmp_issues = Issue.find(:all, :conditions => ["project_id = ? ", project.id])
      tmp_issues.each{ |issue|
        trackers.push(TrackerDto.create(issue.tracker))
      }
      tmp_trackers = project.trackers.find(:all)
      tmp_trackers.collect! {|x| TrackerDto.create(x)}
      trackers.concat(tmp_trackers)
    }
    trackers.uniq!
    trackers.sort!
    return trackers
  end
  
  def available_issue_categories
    tmp = Project.find(:all, :conditions => [ "#{Project.visible_by}"])
    categories = []
    tmp.each { |element|
      categories.concat(element.issue_categories)
    }
    categories.collect! { |element| IssueCategoryDto.create(element)}
    categories.uniq!
    categories.sort!
    return categories
  end
  
end
