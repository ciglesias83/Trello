class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.float :duration
      t.datetime :start_date
      t.datetime :end_date
      t.integer :member_id
      t.boolean :checklist

      t.timestamps
    end
  end
end
