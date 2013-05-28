class Reference < ActiveRecord::Base
  belongs_to :galaxy
  attr_accessible :fits, :filename
  has_attached_file :fits
  validates :fits, :attachment_presence => true

  before_create :assign_galaxy

  def self.find_by_galaxy_name(galaxy_name)
    joins(:galaxy).where('galaxies.name = ?', galaxy_name).readonly(false).first
  end

  def filename=(filename)
    self.fits = File.open(filename)
  end

  def as_json(options = {})
    super(:methods => [:fits])
  end

  private

  def assign_galaxy
    if fits and !galaxy_id
      self.galaxy = Galaxy.find_or_create_by_name(galaxy_name_from_fits)
    end
  end

  def galaxy_name_from_fits
    File.basename(fits_file_name, '.fit')
  end

end
