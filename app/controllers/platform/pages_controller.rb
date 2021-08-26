class Platform::PagesController < PlatformController

  def host_homepage
    @listing = Listing.new #create variables
  end

end
