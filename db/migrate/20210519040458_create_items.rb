class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.boolean :archived

      t.timestamps
    end
  end
end
