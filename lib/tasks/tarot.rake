require 'zip/zip'
namespace :tarot do
  desc 'Import refereneces from archive'
  task :import_refs, [:archive] => :environment do |t, args|
    zip_importer_service = ReferenceZipImporterService.new(args.archive, Reference)
    zip_importer_service.logger_proc = proc do |message|
      puts message
    end
    zip_importer_service.import
    puts "Updated %d, created %d" % [
      zip_importer_service.update_count, zip_importer_service.create_count
    ]
  end
end
