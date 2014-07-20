class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
