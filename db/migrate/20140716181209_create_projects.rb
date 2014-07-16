class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :description
      t.string :title
      t.integer :goal
      t.datetime :start_time
      t.datetime :end_time
      t.string :picture_url
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
