class Reference < ActiveRecord::Base
  belongs_to :galaxy
  attr_accessible :fits, :filename
  has_attached_file :fits

  def filename=(filename)
    self.galaxy = Galaxy.find_or_create_by_name(File.basename(filename, '.fit'))
    self.fits = File.open(filename)
  end
end
