class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :description
      t.integer :amount
      t.references :project, index: true

      t.timestamps
    end
  end
end
