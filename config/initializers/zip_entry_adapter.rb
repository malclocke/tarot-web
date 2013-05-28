module Paperclip
  class ZipEntryAdapter < AbstractAdapter

    def initialize(zip_entry)
      @target = zip_entry
      @original_filename = File.basename(zip_entry.name)
      @tempfile = copy_to_tempfile(@target)
    end

    private

    def copy_to_tempfile(zip_entry)
      src = zip_entry.get_input_stream
      while data = src.read(16*1024)
        destination.write(data)
      end
      destination.rewind
      destination
    end

  end
end

Paperclip.io_adapters.register Paperclip::ZipEntryAdapter do |target|
  Zip::ZipEntry === target
end
