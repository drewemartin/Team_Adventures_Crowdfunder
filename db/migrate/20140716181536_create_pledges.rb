class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true
      t.references :reward, index: true

      t.timestamps
    end
  end
end

