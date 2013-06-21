class RemoveProjectFromDeliverables < ActiveRecord::Migration
  def up
    
    remove_column :deliverables, :project_id

  end

  def down

    # TODO: Fix the fact that we set the default to 0
    add_column :deliverables, :project_id, :integer, :null => false, :default => 0
  end
end
