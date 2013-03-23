class CreateNightImages < ActiveRecord::Migration
  def change
    create_table :night_images do |t|
      t.references :galaxy
      t.date :night

      t.timestamps
    end
    add_index :night_images, :galaxy_id
  end
end
