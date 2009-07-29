#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../api/tracker_api'
require File.dirname(__FILE__) + '/../struct/tracker_dto'

class TrackerService < ActionWebService::Base
  web_service_api TrackerApi
  
  def get_all
    trackers = Tracker.find(:all, :order => 'position')
    trackers.collect!{|x| TrackersDto.create(x)}
    return trackers
  end
end
