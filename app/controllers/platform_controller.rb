class PlatformController < ApplicationController
  before_action :authenticate_host!

  layout 'platform' #inheirt from platform
end
