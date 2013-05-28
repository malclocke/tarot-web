class ReferenceZipImporterService < ZipImporterService
  def create_instance_from_entry(entry)
    galaxy_name = File.basename(entry.name, '.fit')
    if target = target_class.find_by_galaxy_name(galaxy_name)
      log "updating #{entry} (galaxy: #{galaxy_name})"
      target.fits = entry
      target.save!
      self.update_count+=1
    else
      log "creating #{entry} (galaxy: #{galaxy_name})"
      target_class.create!(:fits => entry)
      self.create_count+=1
    end
  end
end
