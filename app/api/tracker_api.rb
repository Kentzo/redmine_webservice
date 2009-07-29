#****************************************************
#                                                   *
# Redmine Webservice - Yohann Monnier - Internethic  *
#													*
#****************************************************

require File.dirname(__FILE__) + '/../struct/tracker_dto'

class TrackerApi < ActionWebService::API::Base
  api_method :get_all,
    :returns => [[TrackerDto]]
end
