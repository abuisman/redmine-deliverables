class CreateDeliverables < ActiveRecord::Migration
  def change

    create_table :deliverables do |t|
      t.references :project
      t.string :name, :null => false

      t.datetime :deadline

      t.boolean :allow_after_deadline

      t.references :author
      t.timestamps
    end

    create_table :hand_ins do |t|
      t.references :deliverable, :null => false

      t.text :notes, :null => true

      t.references :author
      t.timestamps
    end

    create_table :ratings do |t|
      t.references :hand_in

      t.text :notes
      t.float :rating

      t.references :author
      t.timestamps
    end

  end
end
