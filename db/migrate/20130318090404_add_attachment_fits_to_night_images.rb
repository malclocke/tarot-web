class AddAttachmentFitsToNightImages < ActiveRecord::Migration
  def self.up
    change_table :night_images do |t|
      t.attachment :fits
    end
  end

  def self.down
    drop_attached_file :night_images, :fits
  end
end
