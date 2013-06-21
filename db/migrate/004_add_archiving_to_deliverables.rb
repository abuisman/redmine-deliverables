class AddArchivingToDeliverables < ActiveRecord::Migration
  def up
    
    add_column :deliverables, :archived, :boolean, :default => false

  end

  def down
    remove_column :deliverables, :archived
  end
end
