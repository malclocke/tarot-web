require 'zip/zip'

class ZipImporterService

  attr_reader :archive, :target_class
  attr_writer :update_count, :create_count
  attr_accessor :logger_proc

  def initialize(archive, target_class)
    @archive = archive
    @target_class = target_class
  end

  def import
    Zip::ZipFile.foreach(archive) do |entry|
      if entry.file?
        create_instance_from_entry(entry)
      end
    end
  end

  def update_count
    @update_count ||= 0
  end

  def create_count
    @create_count ||= 0
  end

  private

  def log(message)
    if logger_proc
      logger_proc.yield message
    end
  end
end
