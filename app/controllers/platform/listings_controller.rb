class Platform::ListingsController < PlatformController

  def create
    @listing = current_host.listings.create(listing_params)

    if @listing.save
      redirect_to platform_home_path, notice: 'Listing was succesfully created.'
    else
      redirect_to platform_home_path, notice: 'Listing was error. Please try again.'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    if @listing.save
      redirect_to platform_dashboard_path(current_host), notice: 'Listing was successfully updated.'
    else
      redirect_to platform_dashboard_path(current_host), alert: 'There was an error. Please try again.'
    end
  end

  def delete_photo_attachment #to delete a single id
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to platform_dashboard_path(current_host), notice: 'Photo was successfully removed.'
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :description, :price_per_day, :available, :location, :latitude, :longtitude, photos: [])
    end
end
