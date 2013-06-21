class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.references :project
      t.references :deliverable

      t.datetime :deadline

      t.references :author
      t.timestamps
    end

    remove_column :hand_ins, :deliverable_id

    # TODO: Fix the fact that we set the default to 0
    add_column :hand_ins, :request_id, :integer, :null => false, :default => 0
  end

  def down

    # TODO: Fix the fact that we set the default to 0
    add_column :hand_ins, :deliverable_id, :integer, :null => false, :default => 0
  end
end
