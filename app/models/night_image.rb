class NightImage < ActiveRecord::Base
  belongs_to :galaxy
  attr_accessible :night, :fits, :filename
  has_attached_file :fits

  validates :night, :presence => true

  delegate :reference, :to => :galaxy
  delegate :fits, :to => :reference, :prefix => true

  # FIXME Make a real implementation
  # Will eventually need to pick a viable candidate to display to the current
  # user.  For now, juts pick a random image.
  def self.next
    all.sample
  end

  def filename=(filename)
    self.galaxy = Galaxy.find_or_create_by_name(File.basename(filename, '.fit'))
    self.fits = File.open(filename)
  end

  def as_json(options = {})
    super(:methods => [:fits, :reference_fits])
  end
end
