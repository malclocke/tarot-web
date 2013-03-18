class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :galaxy

      t.timestamps
    end
    add_index :references, :galaxy_id
  end
end
