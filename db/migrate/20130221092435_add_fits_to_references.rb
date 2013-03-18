class AddFitsToReferences < ActiveRecord::Migration
  def self.up
    add_attachment :references, :fits
  end
  def self.down
    remove_attachment :references, :fits
  end
end
