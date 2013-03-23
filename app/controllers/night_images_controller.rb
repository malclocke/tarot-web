class NightImagesController < ApplicationController
  respond_to :json

  def next
    @night_image = NightImage.next
    respond_with @night_image
  end
end
