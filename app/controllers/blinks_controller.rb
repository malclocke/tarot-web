class BlinksController < ApplicationController
  def index
    @night_image = NightImage.next
    @reference = @night_image.reference
  end
end
